//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Database
{
    using System;
    using System.Collections.Generic;
    
    public partial class WaitingUser
    {
        public int Id { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public byte Auth { get; set; }
        public System.DateTime CreatedAt { get; set; }
        public System.DateTime ChangedAt { get; set; }
        public bool isActive { get; set; }
        public int OrgFk { get; set; }
    
        public virtual Org Org { get; set; }
    }
}