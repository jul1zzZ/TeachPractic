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
    /// Логика взаимодействия для CatalogPage.xaml
    /// </summary>
    public partial class CatalogPage : Page
    {
        int _itemcount = 0;
        int pageNum = 1;
        public CatalogPage()
        {
            InitializeComponent();
            var patients = PolyclinicEntities.GetContext().Patients.OrderBy(p => p.Name).ToList();
            patients.Insert(0, new Patient
            {
                Name = "Все"
            });
            LViewGoods.ItemsSource = PolyclinicEntities.GetContext().Patients.OrderBy(p => p.Name).ToList();
            _itemcount = LViewGoods.Items.Count;
            TextBlockCount.Text = $"Результат запроса: {_itemcount} записей из {_itemcount}";
        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            if (Visibility == Visibility.Visible)
            {
                PolyclinicEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                LViewGoods.ItemsSource = PolyclinicEntities.GetContext().Patients.OrderBy(p =>
                p.Name).ToList();
            }
        }

       

        private void Update()
        {
            List<Patient> patients = PolyclinicEntities.GetContext().Patients
                .OrderBy(p => p.Name)
                .ToList();

            if (SearchTb.Text.Trim() != "")
            {
                patients = patients
                    .Where(p => p.Name.Trim().ToLower().Contains(SearchTb.Text.Trim().ToLower()) ||
                     p.PhoneNumber.Trim().ToLower().Contains(SearchTb.Text.Trim().ToLower())
                    ).ToList();
            }

            if (AgentFilterCb.SelectedIndex > 0)
            {
                patients = patients.Where(p => p.PatientID == (AgentFilterCb.SelectedItem as Patient).PatientID).ToList();
            }

            if (AgentSortCb.SelectedIndex > 0)
            {
                switch (AgentSortCb.SelectedIndex)
                {
                    case 1:
                        patients = patients.OrderBy(p => p.DateBirth).ToList();
                        break;
                    case 2:
                        patients = patients.OrderByDescending(p => p.DateBirth).ToList();
                        break;
                }
            }


            try
            {
                bool canParse = int.TryParse(PageCount.Text, out int currentPage);
                List<Patient> pageAgents = new List<Patient>();

                currentPage = currentPage <= 0 || currentPage > patients.Count || !canParse ? 1 : currentPage;

                int itemsPerPage = 10;
                int offset = ((currentPage - 1) * itemsPerPage + 1) - 1;
                for (int i = offset; i < itemsPerPage + offset; i++)
                {
                    if (i < patients.Count)
                    {
                        pageAgents.Add(patients[i]);
                    }
                }
                LViewGoods.ItemsSource = pageAgents;
                LViewGoods.ItemsSource = pageAgents;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }

        private void prevPages_Click(object sender, RoutedEventArgs e)
        {
            List<Patient> patients = PolyclinicEntities.GetContext().Patients
              .OrderBy(p => p.Name)
              .ToList();
            if (pageNum > 2)
            {
                pageNum -= 2;
                firstBtn.Content = pageNum;
                secondBtn.Content = pageNum + 1;

            }
        }

        private void firstBtn_Click(object sender, RoutedEventArgs e)
        {
            PageCount.Text = pageNum.ToString();
            Update();
        }

        private void secondBtn_Click(object sender, RoutedEventArgs e)
        {
            PageCount.Text = (pageNum+1).ToString();
            Update();
        }

        private void PageCount_TextChanged(object sender, TextChangedEventArgs e)
        {
            Update();
        }

        private void SearchTb_TextChanged(object sender, TextChangedEventArgs e)
        {
            Update();
        }

        private void AgentSortCb_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Update();
        }

        private void AgentFilterCb_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Update();
        }

        private void BtnNext_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new TablePage());
        }
    }
}
