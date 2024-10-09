
using servicio as db  from '../db/servicio';

service CatalogService @(path: '/CatalogService'){
 
 
entity BusinessPartner as projection on db.BusinessPartner;
entity Servicios as projection on db.Servicios;
entity Consultores as projection on db.Consultores;
entity CategoriaServicio as projection on db.CategoriaServicio;
entity Oportunidades as projection on db.Oportunidades;
entity BusinessPartnerEmpresa as projection on db.BusinessPartner.Empresas;
entity BusinessPartnerPersona as projection on db.BusinessPartner.Persona;
entity cotizacion as projection on db.cotizacion actions{ action CrearRegistro()};
entity cotizacionXOportunidad as projection on db.cotizacionXOportunidad{
  to_servicio.Nombre as servicioText : String,
  *
};
entity ServicioPrestado as projection on db.ServicioPrestado;
entity ServicioXOportunidad as projection on db.ServicioXOportunidad {
  to_servicio.Nombre as servicioTest : String,
  *
};

entity ServiciosXCliente as projection on db.ServiciosXCliente;
entity ActivcidadesXservicio as projection on db.ActivcidadesXservicio;
entity consultoresXservicio as projection on db.consultoresXservicio;


  };
    
  
