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
    
    public partial class Order
    {
        public int OrderId { get; set; }
        public int ProductId { get; set; }
        public int AgentId { get; set; }
        public System.DateTime OrderDate { get; set; }
        public int ProductAmount { get; set; }
        public System.TimeSpan OrderTime { get; set; }
    
        public virtual Agent Agent { get; set; }
        public virtual Product Product { get; set; }
    }
}
