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

        private void AddAgent_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new PatientInfoPage(null));
        }

        private void AgentInfoBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new PatientInfoPage((Patient)(sender as Button).DataContext));
        }
    }
}
