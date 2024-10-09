using CatalogService from '../service';


annotate CatalogService.Servicios with {
    Descripcion @UI.MultiLineText;
    Duracion @Measures.Unit : Tiempo_code;
    Tiempo @Common.IsUnit @Common.ValueListWithFixedValues: true;
};
annotate CatalogService.CategoriaServicio with {
    Descripicion @UI.MultiLineText;
};





annotate CatalogService.Servicios with @(

    UI.FieldGroup #Servicios: {
        $Type: 'UI.FieldGroupType',
        Data : [
            
            {
                $Type                  : 'UI.DataField',
                Value                  : NombreCategorias.NombreCategoria,
                Label                  : 'Nombre Categoria',
                ![@Common.FieldControl]: #ReadOnly,
            },
            {
                $Type : 'UI.DataField',
                Value : Nombre,
                Label : 'Nombre'
            },
            {
                $Type: 'UI.DataField',
                Value: Descripcion,
                Label: 'Descripcion',
            },
            {
                $Type : 'UI.DataField',
                Value : Duracion,
                Label : 'Esfuerzo',
            },
           


        ],
    },

    UI.LineItem             : [
        
        {
            $Type : 'UI.DataField',
            Value : NombreCategorias.NombreCategoria,
            Label : 'Nombre Categorias',
            ![@Common.FieldControl]: #ReadOnly,
        },
        {
            $Type : 'UI.DataField',
            Value : Nombre,
            Label : 'Nombre'
        },
        {
            $Type: 'UI.DataField',
            Value: Descripcion,
            Label: 'Descripcion',
        },
        {
            $Type : 'UI.DataField',
            Value : Duracion,
            Label : 'Esfuerzo',
        },
    ],

    UI.Facets               : [
        {
            $Type : 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#Servicios',
            Label : 'Servicios',
        },
      
    ],

);



annotate CatalogService.CategoriaServicio  @odata.draft.enabled  @(
    UI : {HeaderInfo: {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Servicios',
        TypeNamePlural: 'Servicios',
        Title         : {
            $Type: 'UI.DataField',
            Value: 'Creacion del servicio',
        },
    }, },
    UI.LineItem                     : [
        {
            $Type: 'UI.DataField',
            Value: ID,
            Label: 'ID',
            ![@UI.Hidden],
        },
        {
            $Type: 'UI.DataField',
            Value: NombreCategoria,
            Label: 'Nombre',
        },
        {
            $Type: 'UI.DataField',
            Value: Descripicion,
            Label: 'Descripcion',
        },


    ],
    UI.FieldGroup #CategoriaServicio: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: NombreCategoria,
                Label: 'Categoria',
            },
            {
                $Type: 'UI.DataField',
                Value: Descripicion,
                Label: 'Descripcion',
            },

        ],
    },


    UI.Facets : [

        {
            $Type : 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#CategoriaServicio',
            Label : 'Crear Categoria',

        },
        {
            $Type : 'UI.ReferenceFacet',
            Target: 'Servicio/@UI.LineItem',
            Label : 'Servicios',
        },

    ],
);
