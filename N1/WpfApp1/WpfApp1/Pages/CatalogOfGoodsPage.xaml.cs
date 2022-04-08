using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace WpfApp1.Pages
{
    /// <summary>
    /// Логика взаимодействия для CatalogOfGoodsPage.xaml
    /// </summary>
    public partial class CatalogOfGoodsPage : Page
    {
        int _itemcount = 0;
        public CatalogOfGoodsPage()
        {
            InitializeComponent();
            var developers = GBEntities.GetContext().Developers.OrderBy(p => p.DeveloperName).ToList();
            developers.Insert(0, new Developer
            {
                DeveloperName = "Все типы"
            }
            );
            ComboDeveloper.ItemsSource = developers;
            ComboDeveloper.SelectedIndex = 0;
            LViewGoods.ItemsSource = GBEntities.GetContext().Goods.OrderBy(p => p.GoodName).ToList();
            _itemcount = LViewGoods.Items.Count;
            TextBlockCount.Text = $" Результат запроса: {_itemcount} записей из {_itemcount}";
        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            if (Visibility == Visibility.Visible)
            {
                GBEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                LViewGoods.ItemsSource = GBEntities.GetContext().Goods.OrderBy(p =>
                p.GoodName).ToList();
            }
        }

        private void TBoxSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            UpdateData();
        }

        private void ComboDeveloper_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateData();
        }

        private void UpdateData()
        {
            var currentGoods = GBEntities.GetContext().Goods.OrderBy(p => p.GoodName).ToList();
            if (ComboDeveloper.SelectedIndex > 0)
                currentGoods = currentGoods.Where(p => p.DeveloperId == (ComboDeveloper.SelectedItem as Developer).DeveloperId).ToList();
            currentGoods = currentGoods.Where(p => p.GoodName.ToLower().Contains(TBoxSearch.Text.ToLower())).ToList();
            if (ComboSort.SelectedIndex >= 0) 
            {
                if (ComboSort.SelectedIndex == 0)
                    currentGoods = currentGoods.OrderBy(p => p.Price).ToList();
                if (ComboSort.SelectedIndex == 1)
                    currentGoods = currentGoods.OrderByDescending(p => p.Price).ToList();
            }
            LViewGoods.ItemsSource = currentGoods;
            TextBlockCount.Text = $" Результат запроса: {currentGoods.Count} записей из {_itemcount}";
        }

        private void ComboSort_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateData();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new GoodsPage());
        }
    }
}
