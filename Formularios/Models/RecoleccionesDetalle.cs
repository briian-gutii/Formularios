//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Formularios.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class RecoleccionesDetalle
    {
        public long Id { get; set; }
        public int RecoleccionId { get; set; }
        public int CampoId { get; set; }
        public int TipoId { get; set; }
        public string ValorTexto { get; set; }
        public Nullable<int> ValorNumero { get; set; }
        public Nullable<System.DateTime> ValorFecha { get; set; }
    
        public virtual Campos Campos { get; set; }
        public virtual Recoleccione Recoleccione { get; set; }
        public virtual Tipos Tipos { get; set; }
    }
}
