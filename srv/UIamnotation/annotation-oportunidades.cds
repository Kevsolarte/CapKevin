using CatalogService from '../service';

annotate CatalogService.BusinessPartner with {
    ID @UI.Hidden

};

annotate CatalogService.Servicios with {
    ID @UI.Hidden

};

annotate CatalogService.Oportunidades with {
    TarifaAprox  @Measures.Unit: ValorTarifa_code;
    ValorTarifa  @Common.IsUnit  @Common.ValueListWithFixedValues: true;
    Tiempoaprox  @Measures.Unit: Tiempo_code;
    Tiempo       @Common.IsUnit  @Common.ValueListWithFixedValues: true;
};


annotate CatalogService.Oportunidades with {
    BP @Common: {
        Text           : BP.Nombre,
        TextArrangement: #TextOnly,
        ValueList      : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'BusinessPartner',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: BP_ID,
                    ValueListProperty: 'ID',

                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'Nombre',
                },
            ],
        },

    }
};


annotate CatalogService.Oportunidades with {
    VenderServicio @Common: {
        Text           : VenderServicio.Nombre,
        TextArrangement: #TextOnly,
        ValueList      : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'Servicios',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: VenderServicio_ID,
                    ValueListProperty: 'ID',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'Nombre',

                },


                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'Descripcion',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'Duracion',

                },
                {
                    $Type            : 'Common.ValueListParameterOut',
                    LocalDataProperty: Tiempoaprox,
                    ValueListProperty: 'Duracion',
                },
                {
                    $Type            : 'Common.ValueListParameterOut',
                    LocalDataProperty: Tiempo_code,
                    ValueListProperty: 'Tiempo_code',
                },
            ],
        },

    }
};

annotate CatalogService.Oportunidades with {
    Status @Common.ValueListWithFixedValues: true;

};

annotate CatalogService.Oportunidades with @(
    Capabilities   : {Insertable: IsActiveEntity},
    UI.LineItem #BS: [

    {
        $Type                : 'UI.DataField',
        Value                : VenderServicio_ID,
        Label                : 'Servicio',
        ![@HTML5.CssDefaults]: {
            $Type: 'HTML5.CssDefaultsType',
            width: '5rem'
        },

    }, ],
);


annotate CatalogService.Oportunidades  @odata.draft.enabled  @(
    Common.SideEffects:{
        $Type : 'Common.SideEffectsType',
        SourceProperties : [
            to_servicios.servicioTest
        ],
        TargetEntities : [
            to_servicios
        ],
    },

    UI                          : {HeaderInfo: {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Oportunidades',
        TypeNamePlural: 'oportunidades',
        Title         : {
            $Type: 'UI.DataField',
            Value: Oportunidades,
        },
    }, },


    UI.LineItem                 : [
        {
            $Type                : 'UI.DataField',
            Value                : BP_ID,
            Label                : 'Cliente',
            ![@HTML5.CssDefaults]: {
                $Type: 'HTML5.CssDefaultsType',
                width: '5rem',


            },
        },
        {
            $Type                : 'UI.DataField',
            Value                : VenderServicio_ID,
            Label                : 'Servicio',
            ![@HTML5.CssDefaults]: {
                $Type: 'HTML5.CssDefaultsType',
                width: '5rem'
            },

        },
    ],
    UI.FieldGroup #oportunidades: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: BP_ID,
                Label: 'cliente',

            },
            {
                $Type: 'UI.DataField',
                Value: to_servicios.to_servicio_ID,
                Label: 'servicio',
            },
            {
                $Type: 'UI.DataField',
                Value: TarifaAprox,
                Label: 'Tarifa Aproximada'
            },

            {
                $Type: 'UI.DataField',
                Value: Status_code,
                Label: 'Estado'
            },
            {
                $Type: 'UI.DataField',
                Value: Tiempoaprox,
                Label: 'Tiempo aproximado',
            },
            {
                $Type: 'UI.DataField',
                Value: FechaInicio,
                Label: 'Fecha Inicio',
            },
            {
                $Type: 'UI.DataField',
                Value: FechaFin,
                Label: 'Fecha fin',

            },


        ],

    },
    UI.Facets                   : [
        {
            $Type : 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#oportunidades',
            Label : 'Oportunidades',

        },
        {
            $Type : 'UI.ReferenceFacet',
            Target: 'to_servicios/@UI.LineItem',
        },
        

    ],
);

annotate CatalogService.ServicioXOportunidad with @(UI.LineItem: [{
    $Type: 'UI.DataField',
    Value: to_servicio_ID,
    Label: 'Servicio',
}, ], );

annotate CatalogService.ServicioXOportunidad with {
    to_servicio @Common: {
        Text           : to_servicio.Nombre,
        TextArrangement: #TextOnly,
        ValueList      : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'Servicios',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: to_servicio_ID,
                    ValueListProperty: 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'Nombre',
                },
            ],
        },
    }
}
