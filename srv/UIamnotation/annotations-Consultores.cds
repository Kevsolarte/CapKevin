using CatalogService from '../service';
annotate CatalogService.Consultores with {
    Especialidades @Common.ValueListWithFixedValues: true;
};

annotate CatalogService.Consultores with @odata.draft.enabled @(

 UI: {
HeaderInfo  : {
            $Type : 'UI.HeaderInfoType',
            TypeName : 'Consultores',
            TypeNamePlural : 'Consultores',
            Title : {
                $Type : 'UI.DataField',
                Value : 'Registrar Consultores',
            },
        },
 },


 UI.LineItem : [
        
        {
            $Type : 'UI.DataField',
            Value : NombreConsultor,
            Label : 'Nombre',
            ![@HTML5.CssDefaults] : {
                $Type : 'HTML5.CssDefaultsType',
                width : '5rem',
                
                
            },
        },
        
        {
            $Type : 'UI.DataField',
            Value : ApellidoConsultor,
            Label : 'Apellido',
        },
        {
            $Type : 'UI.DataField',
            Value : CedulaConsultor,
            Label : 'Cedula',
        },
        
        
         

 ],

UI.FieldGroup#Consultores : {
        $Type : 'UI.FieldGroupType',
        Data  : [
        {    $Type : 'UI.DataField',
            Value : NombreConsultor,
            Label : 'Nombre',
        },
        {
            $Type : 'UI.DataField',
            Value : ApellidoConsultor,
            Label : 'Apellido',
        },
        {
            $Type : 'UI.DataField',
            Value : CedulaConsultor,
            Label : 'Cedula',
        },
       
        {
            $Type : 'UI.DataField',
            Value : Especialidades_code,
            Label : 'Especialidades',
        },
        ],
},


UI.Facets : [
    {
        $Type : 'UI.ReferenceFacet',
        Target : ![@UI.FieldGroup#Consultores],
        Label : 'Crear Consultor'
    }
]
);

