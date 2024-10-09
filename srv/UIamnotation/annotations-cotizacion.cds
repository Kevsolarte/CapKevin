using CatalogService from '../service';

annotate CatalogService.cotizacion with {
    Cliente @Common: {
        Text           : Cliente.BP.Nombre,
        TextArrangement: #TextOnly,
        ValueList      : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'Oportunidades',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: Cliente_ID,
                    ValueListProperty: 'ID',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'BP/Nombre',
                },
            ],
        },
    }
}


annotate CatalogService.cotizacion with  @odata.draft.enabled  @(
     UI: {
HeaderInfo  : {
            $Type : 'UI.HeaderInfoType',
            TypeName : 'Cotizacion',
            TypeNamePlural : 'Clientes',
            Title : {
                $Type : 'UI.DataField',
                Value : 'Crear Cotizacion',
            },
        },
 },
    Common.SideEffects       : {
        $Type           : 'Common.SideEffectsType',
        SourceProperties: [to_servicios.servicioText],
        TargetEntities  : [to_servicios],
    },

    UI.FieldGroup #cotizacion: {
        $Type: 'UI.FieldGroupType',
        Data : [

            {
                $Type: 'UI.DataField',
                Value: Cliente_ID,
                Label: 'Clientes',
            },
            {
                $Type: 'UI.DataField',
                Value: to_servicios.to_servicio_ID,
                Label: 'Servicios',
            },
        ]
    },


    UI.LineItem              : [
        {
            $Type                : 'UI.DataField',
            Value                : Cliente_ID,
            Label                : 'Cliente',
            ![@HTML5.CssDefaults]: {
                $Type: 'HTML5.CssDefaultsType',
                width: '5rem',


            },
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action: 'CatalogService.CrearRegistro',
            Label : 'Crear Registro',
            Inline : true,
            ![@UI.Hidden]: {$edmJson: {$If: [
                {$Eq: [
                    {$Path: 'Cerrado'},
                    true
                ]},
                true,
                false
            ]}},
        },
    ],
    UI.Facets                : [
        {
            $Type : 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#cotizacion',
            Label : 'cotizacion',

        },
        {
            $Type : 'UI.ReferenceFacet',
            Target: 'to_servicios/@UI.LineItem',
        },


    ],


);

annotate CatalogService.cotizacionXOportunidad with @(
    UI.LineItem:[
    {
    $Type                  : 'UI.DataField',
    Value                  : to_servicio_ID,
    Label                  : 'Cliente',
    ![@Common.FieldControl]: #ReadOnly,
    }, 
],
);

annotate CatalogService.cotizacionXOportunidad with {
    to_servicio @Common: {
        Text           : to_servicio.Nombre,
        TextArrangement: #TextOnly,
        ValueList      : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'ServicioXOportunidad',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterIn',
                    LocalDataProperty: to_cotizacion.Cliente_ID,
                    ValueListProperty: 'to_oportunidad_ID',
                },
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: to_servicio_ID,
                    ValueListProperty: 'to_servicio_ID',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'servicioTest',
                },
            ],
        },
    }
};
