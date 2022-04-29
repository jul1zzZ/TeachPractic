
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.IO;
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
using WpfApp2;

namespace WpfApp2
{
    /// <summary>
    /// Логика взаимодействия для PatientInfoPage.xaml
    /// </summary>
    public partial class PatientInfoPage : Page
    {
        public string _photoDirectory = $@"{Directory.GetCurrentDirectory()}\Images\";
        private string _photoPath;
        private string _photoName;
        public Patient Patient { get; set; }
        public PatientInfoPage(Patient patient1)
        {
            InitializeComponent();
            Patient = new Patient();

            if (patient1 != null)
            {
                Patient = patient1;
                TextBoxGoodId.Visibility = Visibility.Hidden;
                TextBlockGoodID.Visibility = Visibility.Hidden;
                int x = patient1.PatientID;
                List<Patient> additional = PolyclinicEntities.GetContext().Patients.Where(p =>
                p.PatientID == patient1.PatientID).ToList();
                List<Patient> patients = new List<Patient>();
                _photoPath = _photoDirectory + Patient.Photo;
            }
            DataContext = Patient;
            _photoName = Patient.Photo;
        }

        private void LoadPhotoBtn_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog();

            openFileDialog.Filter = "JPG Files (*.jpg)|*.jpg|PNG Files (*.png)|*.png";
            if (openFileDialog.ShowDialog() == false)
            {
                return;
            }

            FileInfo fileInfo = new FileInfo(openFileDialog.FileName);

            if (fileInfo.Length > 8 * 1024 * 1024 * 6)
            {
                MessageBox.Show("Размер фото не должен превышать 6 мб");
                return;
            }

            _photoName = Guid.NewGuid().ToString();
            _photoPath = fileInfo.FullName;
            Image1.Source = new BitmapImage(new Uri(_photoPath));
        }

        private void SaveBtn_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show(Patient.Name);
            try
            {
              
                if (_photoPath != null)
                {
                    Patient.Photo = _photoName;
                    File.Copy(_photoPath, _photoDirectory + _photoName);
                }
                if (Patient.PatientID == 0)
                {
                    PolyclinicEntities.GetContext().Patients.Add(Patient);
                }
                PolyclinicEntities.GetContext().SaveChanges();
                NavigationService.GoBack();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.InnerException.Message);
            }
        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            List<Patient> additional = PolyclinicEntities.GetContext().Patients.Where(p => p.PatientID == Patient.PatientID).ToList();
            List<Patient> goods = new List<Patient>();
        }
    }
}
