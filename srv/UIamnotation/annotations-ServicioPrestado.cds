using CatalogService from '../service';

annotate CatalogService.ServiciosXCliente with {
    to_servicio @Common : { Text : to_servicio.Nombre, TextArrangement : #TextOnly, }
};




annotate CatalogService.ServiciosXCliente with @(
    UI.LineItem                 : [
        {
            $Type : 'UI.DataField',
            Value : to_servicio_ID,
            Label : 'Servicio',
            ![@Common.FieldControl] : #ReadOnly,
        },



    ],
    UI.Facets:[
        {
            $Type : 'UI.ReferenceFacet',
            Target : 'Actividades/@UI.LineItem',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Target : 'consultores/@UI.LineItem',
        },
    ],

);
annotate CatalogService.ServiciosXCliente with {
    ID @UI.Hidden
};

annotate CatalogService.ServicioPrestado with @odata.draft.enabled @(
     UI: {
HeaderInfo  : {
            $Type : 'UI.HeaderInfoType',
            TypeName : 'Servcicio Prestado',
            TypeNamePlural : 'Servicios',
            Title : {
                $Type : 'UI.DataField',
                Value : 'Servicios',
            },
        },
 },
UI.LineItem :     
 
   [
        {
            $Type                : 'UI.DataField',
            Value                : Cliente.Cliente.BP.Nombre,
            Label                : 'Cliente',
            ![@HTML5.CssDefaults]: {
                $Type: 'HTML5.CssDefaultsType',
                width: '5rem'
            },

        },
    ],
 
 
UI.Facets : [
    {
        $Type : 'UI.ReferenceFacet',
        Target : 'to_Services/@UI.LineItem',
    },
    
]

);
annotate CatalogService.ActivcidadesXservicio with {
    Costo @Measures.Unit : ValorActividades_code;
};

annotate CatalogService.ActivcidadesXservicio with @(
     UI: {
HeaderInfo  : {
            $Type : 'UI.HeaderInfoType',
            TypeName : 'Actividades',
            TypeNamePlural : 'Asignar Actividades',
            Title : {
                $Type : 'UI.DataField',
                Value : 'Actividades',
            },
        },
 },
    UI.LineItem: [
      {
          $Type : 'UI.DataField',
          Value : Descripcion,
      },
      {
          $Type : 'UI.DataField',
          Value : FechaInicio,
          Label : 'Fecha Inicio'
      },
      {
          $Type : 'UI.DataField',
          Value : FechaFin,
          Label : 'Fecha fin',
      },  
      {
        $Type : 'UI.DataField',
        Value : Costo,
      },
      
      {
        $Type : 'UI.DataField',
        Value : Esfuerzo,
      }
    ],




);
annotate CatalogService.consultoresXservicio with {
    to_consultor @Common : { 
        Text : to_consultor.NombreConsultor,
        TextArrangement : #TextOnly,
        ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Consultores',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : to_consultor_ID,
                    ValueListProperty : 'ID',
                    
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'CedulaConsultor',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'NombreConsultor',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'ApellidoConsultor',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'Especialidades_code',
                }
            ],
        },
    };
    to_actividad@Common : { Text : to_actividad.Descripcion,
    TextArrangement : #TextOnly,
    ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'ActivcidadesXservicio',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterIn',
                LocalDataProperty : to_servicio_ID,
                ValueListProperty : 'servicioprestado_ID',
            },
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : to_actividad_ID,
                ValueListProperty : 'ID',
                
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'Descripcion',
            },
        ],
    }, } 
     
}

;


annotate CatalogService.consultoresXservicio with @(
  UI: {
HeaderInfo  : {
            $Type : 'UI.HeaderInfoType',
            TypeName : 'Consultores',
            TypeNamePlural : 'Asignar Consultores',
            Title : {
                $Type : 'UI.DataField',
                Value : 'Consultores',
            },
        },
 },
UI.LineItem: [
      {
          $Type : 'UI.DataField',
          Value : to_consultor_ID,
          Label : 'Consultor'
      },
      {
          $Type : 'UI.DataField',
          Value : to_actividad_ID,
          Label : 'Actividades'
      },
      

],
);


