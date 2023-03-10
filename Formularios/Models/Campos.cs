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
    
    public partial class Campos
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Campos()
        {
            this.RecoleccionesDetalles = new HashSet<RecoleccionesDetalle>();
        }
    
        public int Id { get; set; }
        public int FormularioId { get; set; }
        public string Campo { get; set; }
        public string Titulo { get; set; }
        public int TipoId { get; set; }
        public bool Requerido { get; set; }
    
        public virtual Formulario Formulario { get; set; }
        public virtual Tipos Tipos { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RecoleccionesDetalle> RecoleccionesDetalles { get; set; }
    }
}
