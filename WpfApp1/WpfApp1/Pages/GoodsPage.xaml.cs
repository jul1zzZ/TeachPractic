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
using WpfApp1.Pages;

namespace WpfApp1.Pages
{
    /// <summary>
    /// Логика взаимодействия для GoodsPage.xaml
    /// </summary>
    public partial class GoodsPage : Page
    {
        public GoodsPage()
        {
            InitializeComponent();
        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            if (Visibility == Visibility.Visible)
            {
                DataGridGood.ItemsSource = null;
                GBEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                List<Good> goods = GBEntities.GetContext().Goods.OrderBy(p => p.GoodName).ToList();
                DataGridGood.ItemsSource = goods;
            }
        }

        private void DataGridGood_LoadingRow(object sender, DataGridRowEventArgs e)
        {
            e.Row.Header = (e.Row.GetIndex() + 1).ToString();
        }

        private void BtnEdit_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AddGoodPage((sender as Button).DataContext as Good));
        }

        private void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AddGoodPage(null));
        }

        private void BtnDelete_Click(object sender, RoutedEventArgs e)
        {
            var selectedGoods = DataGridGood.SelectedItems.Cast<Good>().ToList();
            MessageBoxResult messageBoxResult = MessageBox.Show($"Удалить {selectedGoods.Count()}записей ??? ", "Удаление", MessageBoxButton.OKCancel, MessageBoxImage.Question);
            if (messageBoxResult == MessageBoxResult.OK)
            {
                try
                {
                    Good x = selectedGoods[0];
                    if (x.Sells.Count > 0)
                        throw new Exception("Есть записи в продажах");
                    var complects = GBEntities.GetContext().Complects.Where(p => p.MainGoodId == x.GoodId || p.SecondGoodId == x.GoodId).ToList();
                    GBEntities.GetContext().Complects.RemoveRange(complects);
                    GBEntities.GetContext().Goods.Remove(x);
                    GBEntities.GetContext().SaveChanges();
                    MessageBox.Show("Записи удалены");
                    List<Good> goods = GBEntities.GetContext().Goods.OrderBy(p =>
                    p.GoodName).ToList();
                    DataGridGood.ItemsSource = null;
                    DataGridGood.ItemsSource = goods;
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString(), "Ошибка удаления", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

            private void BtnSell_Click(object sender, RoutedEventArgs e)
            {
            Manager.MainFrame.Navigate(new SellGoodPage((sender as Button).DataContext as Good));
            }
    }
}
