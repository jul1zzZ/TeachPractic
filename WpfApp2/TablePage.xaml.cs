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

namespace WpfApp2
{
    /// <summary>
    /// Логика взаимодействия для TablePage.xaml
    /// </summary
    public partial class TablePage : Page
    {
        public List<Patient> Patients { get; set; }
        public TablePage()
        {
            InitializeComponent();
            Patients = PolyclinicEntities.GetContext().Patients.ToList();
            DataContext = this;
        }

        private void AgentInfoBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new PatientInfoPage((Patient)(sender as Button).DataContext));
            ///Manager.MainFrame.Navigate(new PatientInfoPage((Patient)(sender as Button).DataContext));
        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            DataGridGood.ItemsSource = null;
            PolyclinicEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
            List<Patient> goods = PolyclinicEntities.GetContext().Patients.OrderBy(p => p.Name).ToList();
            DataGridGood.ItemsSource = goods;
        }

        private void DataGridGood_LoadingRow(object sender, DataGridRowEventArgs e)
        {
            e.Row.Header = (e.Row.GetIndex() + 1).ToString();
        }

        private void BtnDelete_Click(object sender, RoutedEventArgs e)
        {
            var patient = DataGridGood.SelectedItems.Cast<Patient>().ToList();
            MessageBoxResult messageBoxResult = MessageBox.Show($"Удалить {patient.Count()}записей ??? ", "Удаление", MessageBoxButton.OKCancel, MessageBoxImage.Question);
            if (messageBoxResult == MessageBoxResult.OK)
            {
                try
                {
                    Patient x = patient[0];
                    var complects = PolyclinicEntities.GetContext().Patients.Where(p => p.PatientID == x.PatientID).ToList();
                    PolyclinicEntities.GetContext().Patients.RemoveRange(complects);
                    PolyclinicEntities.GetContext().Patients.Remove(x);
                    PolyclinicEntities.GetContext().SaveChanges();
                    MessageBox.Show("Записи удалены");
                    List<Patient> goods = PolyclinicEntities.GetContext().Patients.OrderBy(p =>
                    p.Name).ToList();
                    DataGridGood.ItemsSource = null;
                    DataGridGood.ItemsSource = goods;
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString(), "Ошибка удаления", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        private void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new PatientInfoPage(null));
        }
    }
}
