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
    /// Логика взаимодействия для SellGoodPage.xaml
    /// </summary>
    public partial class SellGoodPage : Page
    {
        public SellGoodPage(Good good)
        {
            InitializeComponent();
            LoadData(good);
        }

        void LoadData(Good good)
        {
            DataGridSells.ItemsSource = GBEntities.GetContext().Sells.Where(p => p.GoodId == good.GoodId).OrderBy(p => p.DateSell).ToList();
            ComboGoods.ItemsSource = GBEntities.GetContext().Goods.OrderBy(p => p.GoodName).ToList(); ;
            ComboGoods.SelectedIndex = 0;
            ComboGoods.SelectedValue = good.GoodId;
            GridGood.DataContext = good;
        }

        private void ComboGoods_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (ComboGoods.SelectedIndex > 0)
            {
                int goodId = Convert.ToInt32(ComboGoods.SelectedValue);
                var x = GBEntities.GetContext().Sells.Where(p => p.GoodId == goodId).OrderBy(p => p.DateSell).ToList();
                DataGridSells.ItemsSource = x;
                GridGood.DataContext = ComboGoods.SelectedItem;
            }
        }
    }
}
