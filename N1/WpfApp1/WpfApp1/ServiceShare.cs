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
    
    public partial class ServiceShare
    {
        public int ServiceShareId { get; set; }
        public int ShareId { get; set; }
        public int ServiceId { get; set; }
    
        public virtual Service Service { get; set; }
        public virtual Share Share { get; set; }
    }
}