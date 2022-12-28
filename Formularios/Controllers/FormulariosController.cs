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
    public class FormulariosController : Controller
    {
        private formulariosEntities db = new formulariosEntities();

        // GET: Formularios
        public ActionResult Index()
        {
            return View(db.Formularios.Where(x => x.AspNetUser.UserName == User.Identity.Name).ToList());
        }


        // GET: Formularios/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Formularios/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Nombre,Descripcion")] Formulario formulario)
        {
            var usuarioId = db.AspNetUsers.FirstOrDefault(x => x.UserName == User.Identity.Name)?.Id;
            var ultimoId = db.Formularios.Count() + 1;
            formulario.UsuarioId = usuarioId;
            formulario.Url = System.IO.Path.GetRandomFileName().Replace(".", ultimoId.ToString());
            if (ModelState.IsValid)
            {
                db.Formularios.Add(formulario);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(formulario);
        }

        // GET: Formularios/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Formulario formulario = db.Formularios.FirstOrDefault(x => x.AspNetUser.UserName == User.Identity.Name && x.Id == id);
            if (formulario == null)
            {
                return HttpNotFound();
            }
            return View(formulario);
        }

        // POST: Formularios/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(string Nombre, string Descripcion, int id)
        {
            Formulario formulario = db.Formularios.FirstOrDefault(x => x.AspNetUser.UserName == User.Identity.Name && x.Id == id);
            if (formulario == null)
            {
                return HttpNotFound();
            }

            formulario.Nombre = Nombre;
            formulario.Descripcion = Descripcion;
            db.Entry(formulario).State = EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index");

        }

        // GET: Formularios/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Formulario formulario = db.Formularios.FirstOrDefault(x => x.AspNetUser.UserName == User.Identity.Name && x.Id == id);
            if (formulario == null)
            {
                return HttpNotFound();
            }
            return View(formulario);
        }

        // POST: Formularios/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Formulario formulario = db.Formularios.FirstOrDefault(x => x.AspNetUser.UserName == User.Identity.Name && x.Id == id);
            if (formulario == null)
            {
                return HttpNotFound();
            }
            db.Formularios.Remove(formulario);
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

        [AllowAnonymous]
        public ActionResult Llenar(string id)
        {
            var campos = db.Campos.Where(x => x.Formulario.Url == id).Include(c => c.Formulario).Include(c => c.Tipos);
            if (campos.Any())
            {
                return View(campos.ToList());
            }
            else
            {
                return HttpNotFound();
            }
        }

        [ValidateAntiForgeryToken,AllowAnonymous,HttpPost]
        public ActionResult Llenar(List<RecoleccionesDetalle> detalles, string url)
        {
            Formulario formulario = db.Formularios.FirstOrDefault(x => x.Url == url);
            if (formulario == null)
            {
                return HttpNotFound();
            }

            var recoleccion = new Recoleccione();
            recoleccion.FechaRegistro = DateTime.Now;
            recoleccion.FormularioId = formulario.Id;
            recoleccion.RecoleccionesDetalles = detalles;

            db.Recolecciones.Add(recoleccion);
            db.SaveChanges();
            return RedirectToAction("Gracias");
        }


        [AllowAnonymous]
        public ActionResult Gracias()
        {
            return View();
        }


        public ActionResult Resultados(int id)
        {
            var resultados = db.Recolecciones.Where(x => x.FormularioId == id && x.Formulario.AspNetUser.UserName == User.Identity.Name)
                .Include(c => c.Formulario).Include(c => c.RecoleccionesDetalles);

            return View(resultados.ToList());

        }
    }
}
