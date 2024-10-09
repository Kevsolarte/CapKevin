namespace servicio;
using { sap.common.CodeList, cuid  } from '@sap/cds/common';

entity BusinessPartner : cuid {
    Nombre : String;
    Tipopersona : Association to Tipodepersona@mandatory;
    numeroDocumento : String;
    Persona : Composition of Personasap;
    Empresas : Composition of Empresaap;
    TipoDocumento : Association to TipoDocumento;
    oportunidad : Association to many Oportunidades on oportunidad.BP = $self;
};
aspect Personasap : cuid {
    Nombre : String;
    Apellido : String;
    FechaNacimiento : Date;
    Cedula : String;
    Direccion : String;
    CorreoElectronico : String;
    Numerodetelefono : String;
    isSet : Boolean default false;
    RolPersona : Association to ListaRol;
    
};
aspect Empresaap : cuid {
    NombreEmpresa : String;
    DireccionEmpresa : String;
    NumeroEmpresa : String;
    RolEmpresa : Association to ListaRol;
    isSet : Boolean default false;
};


entity CategoriaServicio : cuid {
    NombreCategoria : String;
    Descripicion : String;
    Servicio : Composition of many Servicios on Servicio.NombreCategorias = $self;
}



entity Servicios : cuid {
    Nombre : String;
    NombreCategorias : Association to CategoriaServicio;
    Descripcion : String;
    Tiempo : Association to UnidadMedidaTiempo; 
    Duracion : String;
   
    
};





entity Consultores : cuid {
    NombreConsultor: String;
    ApellidoConsultor: String;
    CedulaConsultor: String;
    Especialidades:  Association to EspecialidadesList@mandatory;  
}

entity Oportunidades {
    key ID        : UUID;
    Oportunidades : String;
    BP : Association to BusinessPartner;
    VenderServicio   : Association to Servicios;
    TarifaAprox : Decimal;
    FechaInicio : Date;
    FechaFin : Date;
    ValorTarifa : Association to ValorTarifaLista;
    Tiempoaprox : String;
    Tiempo : Association to UnidadMedidaTiempo;
    Status : Association to EstadoLista;
    to_servicios : Composition of many ServicioXOportunidad on to_servicios.to_oportunidad = $self;
};

entity ServicioXOportunidad:cuid {
   to_servicio : Association to Servicios;
   to_oportunidad : Association to  Oportunidades; 
};

entity cotizacion : cuid {
    Cliente : Association to Oportunidades;
    to_servicios: Composition of many cotizacionXOportunidad on to_servicios.to_cotizacion = $self;
    Cerrado : Boolean;
    
};

entity cotizacionXOportunidad:cuid {
  to_servicio : Association to Servicios;
  to_cotizacion : Association to cotizacion;
};


entity ActivcidadesXservicio : cuid{
    Esfuerzo : Int64;
    FechaInicio : Date;
    FechaFin : Date;
    Descripcion : String;
    Recursos : Association to Consultores;
    Costo: Decimal;
    servicioprestado : Association to ServiciosXCliente;
    ValorActividades : Association to ValorActividades;
};


entity ServicioPrestado : cuid {
    Cliente: Association to cotizacion;
    to_Services : Composition of many ServiciosXCliente on to_Services.to_ServicioPrestado = $self;
};

entity ServiciosXCliente :cuid{
    to_ServicioPrestado: Association to ServicioPrestado;
    to_servicio: Association to Servicios;
    Actividades : Composition of many ActivcidadesXservicio on Actividades.servicioprestado = $self;
    consultores : Composition of many consultoresXservicio on consultores.to_servicio = $self;

}

entity consultoresXservicio : cuid {
    to_consultor : Association to Consultores;
    to_servicio : Association to ServiciosXCliente;
    to_actividad : Association to ActivcidadesXservicio;

    
}
entity ValorTarifaLista : CodeList {
key code : String enum {
        Valor1 = 'String';
        Valor2 = 'String';
       
    };
    name : String @UI.Hidden;
    descr : String @UI.Hidden;
};

entity EstadoLista : CodeList {
key code : String enum {
        Estado1 = 'String';
        Estado2 = 'String';
        Estado3 = 'String';
    };
    name : String @UI.Hidden;
    descr : String @UI.Hidden;
};
entity EspecialidadesList : CodeList {
    key code : String enum {
        Especialidades1 = 'String';
        Especialidades2 = 'String';
        Especialidades3 = 'String';
    };
    name : String @UI.Hidden;
    descr : String @UI.Hidden;
    
}
entity TipoDocumento : CodeList {
    key code : String enum {
        Persona1 = 'String';
        Persona2 = 'String';
    };
    name : String @UI.Hidden; 
    descr : String @UI.Hidden;
};
entity Tipodepersona : CodeList {
    key code : String enum {
        Persona1 = 'String';
        Persona2 = 'String';
    };
    name : String @UI.Hidden;
    descr : String @UI.Hidden;
};
entity UnidadMedidaTiempo : CodeList {
key code : String enum {
        Tiempo1 = 'String';
    };
    name : String @UI.Hidden;
    descr : String @UI.Hidden;
    
}
entity ListaRol : CodeList {
    key code : String enum {
        Rol1 = 'String';
        Rol2 = 'String';
        Rol3 = 'String';
    };
    name : String @UI.Hidden;
    descr : String @UI.Hidden;
};
entity ValorActividades : CodeList {
key code : String enum {
        Valor1 = 'String';
    };
    name : String @UI.Hidden;
    descr : String @UI.Hidden;
};