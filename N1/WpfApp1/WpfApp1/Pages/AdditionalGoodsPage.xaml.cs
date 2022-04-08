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
    /// Логика взаимодействия для AdditionalGoodsPage.xaml
    /// </summary>
    public partial class AdditionalGoodsPage : Page
    {
        Good _currentGood = null;
        public AdditionalGoodsPage(Good good)
        {
            InitializeComponent();
            _currentGood = good;
            LoadGoodsIntoCombo(good);
            LoadData(good);
        }

        void LoadGoodsIntoCombo(Good good)
        {
            ComboGoods.ItemsSource = GBEntities.GetContext().Goods.OrderBy(p =>
            p.GoodName).ToList();
            ComboGoods.SelectedIndex = 0;
            ComboGoods.SelectedValue = good.GoodId;
        }

        void LoadData(Good good)
        {
            List<Complect> additional = GBEntities.GetContext().Complects.Where(p => p.MainGoodId
            == good.GoodId).ToList();
            List<Good> goods = new List<Good>();
            List<Good> allGoods = GBEntities.GetContext().Goods.Where(p => p.Active ==
            true).ToList();
            foreach (Complect item in additional)
            {
                goods.Add(item.Good1);
                allGoods.Remove(item.Good1);
            }
            allGoods.Remove(good);
            ListBoxAdditional.ItemsSource = goods;
            ListBoxAllGoods.ItemsSource = allGoods;
        }

        private void ComboGoods_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (ComboGoods.SelectedIndex >= 0)
            {
                int goodId = Convert.ToInt32(ComboGoods.SelectedValue);
                var x = GBEntities.GetContext().Goods.FirstOrDefault(p => p.GoodId == goodId);
                _currentGood = x;
                LoadData(x);
            }
        }

        private void BtnDelete_Click(object sender, RoutedEventArgs e)
        {
            var g = (sender as Button).DataContext as Good;
            var deletedItem = GBEntities.GetContext().Complects.FirstOrDefault(p => p.MainGoodId == _currentGood.GoodId && p.SecondGoodId == g.GoodId);
            MessageBoxResult messageBoxResult = MessageBox.Show($"Удалить запись???","Удаление", MessageBoxButton.OKCancel, MessageBoxImage.Question);
            if (messageBoxResult == MessageBoxResult.OK)
            {
                try
                {
                    GBEntities.GetContext().Complects.Remove(deletedItem);
                    GBEntities.GetContext().SaveChanges();
                    MessageBox.Show("Запись удалена");
                    LoadData(_currentGood);
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString(), "Ошибка удаления", MessageBoxButton.OK,
                    MessageBoxImage.Error);
                }
            }
        }

        private void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            var g = (sender as Button).DataContext as Good;
            Complect complect = new Complect();
            complect.MainGoodId = _currentGood.GoodId;
            complect.SecondGoodId = g.GoodId;
            MessageBoxResult messageBoxResult = MessageBox.Show($"Добавить запись???","Удаление", MessageBoxButton.OKCancel, MessageBoxImage.Question);
            if (messageBoxResult == MessageBoxResult.OK)
            {
                try
                {
                    GBEntities.GetContext().Complects.Add(complect);
                    GBEntities.GetContext().SaveChanges();
                    MessageBox.Show("Запись добавлена");
                    LoadData(_currentGood);
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString(), "Ошибка добавления", MessageBoxButton.OK,
                    MessageBoxImage.Error);
                }
            }
        }
    }
}
