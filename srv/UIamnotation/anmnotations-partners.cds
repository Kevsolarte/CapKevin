using { CatalogService } from '../service';
using from './annotation-oportunidades';


annotate CatalogService.BusinessPartner with{
    Tipopersona   @Common.ValueListWithFixedValues: true;
    numeroDocumento @Measures.Unit : TipoDocumento_code;
    TipoDocumento @Common.IsUnit     @Common.ValueListWithFixedValues: true;
    
};
annotate CatalogService.BusinessPartnerEmpresa with {
    RolEmpresa @Common.ValueListWithFixedValues : true;

};
annotate CatalogService.BusinessPartnerPersona with {
    RolPersona @Common.ValueListWithFixedValues : true;
    
};




annotate CatalogService.BusinessPartnerEmpresa with @( 


UI.FieldGroup#Empresa : {
        $Type : 'UI.FieldGroupType',
        Data  : [
        {   $Type : 'UI.DataField',
            Value : NombreEmpresa,
            Label : 'Nombre',
        
        },
        {
            $Type : 'UI.DataField',
            Value : NumeroEmpresa,
            Label : 'Numero'
        },
        {
            $Type : 'UI.DataField',
            Value : DireccionEmpresa,
            Label : 'Direccion',
        },
        {
            $Type : 'UI.DataField',
            Value : RolEmpresa_code,
            Label : 'Rol',
        },
    ],
},

);


annotate CatalogService.BusinessPartnerPersona with @(

UI.FieldGroup#Persona : {
        $Type : 'UI.FieldGroupType',
        Data  : [
        {    $Type : 'UI.DataField',
            Value : Nombre,
            Label : 'nombre',
        },
        {
            $Type : 'UI.DataField',
            Value : Apellido,
            Label : 'Apellido',
        },
        {
            $Type : 'UI.DataField',
            Value : FechaNacimiento,
            Label : 'Fecha De Nacimiento',
        },
       
        {
            $Type : 'UI.DataField',
            Value : Numerodetelefono,
            Label : 'Telefono'
        },
        {
            $Type : 'UI.DataField',
            Value : Direccion,
            Label : 'Direccion',
        },
        {
            $Type : 'UI.DataField',
            Value : CorreoElectronico,
            Label : 'Correo electronico'
        },
        {
            $Type : 'UI.DataField',
            Value : RolPersona_code,
            Label : 'Rol',
        },
    ],
},

);

annotate CatalogService.BusinessPartner @odata.draft.enabled @(

     UI: {
HeaderInfo  : {
            $Type : 'UI.HeaderInfoType',
            TypeName : 'Partner',
            TypeNamePlural : 'Partner',
            Title : {
                $Type : 'UI.DataField',
                Value : 'Registrar Partner',
            },
        },
 },


 UI.LineItem : [
        
        {
            $Type : 'UI.DataField',
            Value : Tipopersona_code,
            Label : 'Persona',
            ![@HTML5.CssDefaults] : {
                $Type : 'HTML5.CssDefaultsType',
                width : '5rem',
                
                
            },
        },
        
        {
            $Type : 'UI.DataField',
            Value : numeroDocumento,
            Label : 'Documento',
        },
        {
            $Type : 'UI.DataField',
            Value : Nombre,
            Label : 'Nombre',
        },
        
         
],

UI.FieldGroup#Partner : {
        $Type : 'UI.FieldGroupType',
        Data  : [
            {    $Type : 'UI.DataField',
            Value : Tipopersona_code,
            Label : 'Tipo de persona',
        
        },
        
        {
            $Type : 'UI.DataField',
            Value : numeroDocumento,
            Label : 'Numero de documento',
        },
    
    ],
},








UI.Facets : [
    {
        $Type : 'UI.ReferenceFacet',
        Target : '@UI.FieldGroup#Partner',
        Label : 'Crear Partner',
        
    },
    
    
    
    {
        $Type : 'UI.CollectionFacet',
        Facets : [
            {
        $Type : 'UI.ReferenceFacet',
        Target : 'Persona/@UI.FieldGroup#Persona',
        Label : 'Informacion de Persona',
        ![@UI.Hidden]: {$edmJson: {$If: [
                {$Eq: [
                    {$Path: 'Tipopersona_code'},
                    'Persona'
                ]},
                false,
                true
            ]}},
    },
    {
        $Type : 'UI.ReferenceFacet',
        Target : 'Empresas/@UI.FieldGroup#Empresa',
        Label : 'Informacion de Empresa',
                ![@UI.Hidden]: {$edmJson: {$If: [
                {$Eq: [
                    {$Path: 'Tipopersona_code'},
                    'Empresa'
                ]},
                false,
                true
            ]}},
    },
        ],
        Label : 'Informacion del Socio',
    },

    {
        $Type : 'UI.ReferenceFacet',
        Target : 'oportunidad/@UI.LineItem#BS',
    },
 
  
]

);






