//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WpfApp1
{
    using System;
    using System.Collections.Generic;
    
    public partial class Visit
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Visit()
        {
            this.SellVisits = new HashSet<SellVisit>();
        }
    
        public int VisitId { get; set; }
        public int ClientId { get; set; }
        public int TimeSheetId { get; set; }
        public System.DateTime DateRegs { get; set; }
        public bool Paid { get; set; }
        public string Rewiew { get; set; }
        public Nullable<System.DateTime> DateActual { get; set; }
        public string Documents { get; set; }
    
        public virtual Client Client { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SellVisit> SellVisits { get; set; }
        public virtual TimeSheet TimeSheet { get; set; }
    }
}
