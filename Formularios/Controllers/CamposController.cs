using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Formularios.Models;

namespace Formularios.Controllers
{
    [Authorize]
    public class CamposController : Controller
    {
        private formulariosEntities db = new formulariosEntities();

        // GET: Campos
        public ActionResult Index(int id)
        {
            var campos = db.Campos.Where(x => x.FormularioId == id && x.Formulario.AspNetUser.UserName == User.Identity.Name).Include(c => c.Formulario).Include(c => c.Tipos);
            return View(campos.ToList());
        }
        
        // GET: Campos/Create
        public ActionResult Create(int id)
        {
            Formulario formulario = db.Formularios.FirstOrDefault(x => x.AspNetUser.UserName == User.Identity.Name && x.Id == id);
            if (formulario == null)
            {
                return HttpNotFound();
            }
            ViewBag.Formulario = formulario;
            ViewBag.TipoId = new SelectList(db.Tipos, "Id", "Nombre");
            return View();
        }

        // POST: Campos/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "FormularioId,Campo,Titulo,TipoId,Requerido")] Campos campos)
        {
            Formulario formulario = db.Formularios.FirstOrDefault(x => x.AspNetUser.UserName == User.Identity.Name && x.Id == campos.FormularioId);
            if (formulario == null)
            {
                return HttpNotFound();
            }


            if (ModelState.IsValid)
            {
                db.Campos.Add(campos);
                db.SaveChanges();
                return RedirectToAction("Index",new { id = campos.FormularioId });
            }

            ViewBag.Formulario = formulario;
            ViewBag.TipoId = new SelectList(db.Tipos, "Id", "Nombre", campos.TipoId);
            return View(campos);
        }

        // GET: Campos/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Campos campos = db.Campos.FirstOrDefault(x => x.FormularioId == id && x.Formulario.AspNetUser.UserName == User.Identity.Name);
            if (campos == null)
            {
                return HttpNotFound();
            }
            ViewBag.TipoId = new SelectList(db.Tipos, "Id", "Nombre", campos.TipoId);
            return View(campos);
        }

        // POST: Campos/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Campo,Titulo,TipoId,Requerido")] Campos campos)
        {
            if (ModelState.IsValid)
            {
                db.Entry(campos).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.TipoId = new SelectList(db.Tipos, "Id", "Nombre", campos.TipoId);
            return View(campos);
        }

        // GET: Campos/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Campos campos = db.Campos.FirstOrDefault(x => x.FormularioId == id && x.Formulario.AspNetUser.UserName == User.Identity.Name);
            if (campos == null)
            {
                return HttpNotFound();
            }
            return View(campos);
        }

        // POST: Campos/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Campos campos = db.Campos.FirstOrDefault(x => x.FormularioId == id && x.Formulario.AspNetUser.UserName == User.Identity.Name);
            if (campos == null)
            {
                return HttpNotFound();
            }
            db.Campos.Remove(campos);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
