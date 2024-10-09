using  { CatalogService} from '../service';


annotate CatalogService.BusinessPartner with @(
UI.HeaderInfo#ynamicSubtitle :  {
    $Type : 'UI.HeaderInfoType',
    TypeName : 'BusinessPartner',
    TypeNamePlural : 'oportunidades',
           
        },

 
  
UI.LineItem#OVP : [
    {
        $Type : 'UI.DataField',
        Label : 'Cliente',
        Value : Persona.Nombre
    },
    {
        $Type : 'UI.DataField',
        Label : 'Fecha inicio',
        Value : numeroDocumento
    },
   
]

);   

annotate CatalogService.BusinessPartner with @(
    UI.HeaderInfo#Empresas :  {
            $Type : 'UI.HeaderInfoType',
            TypeName : 'oportunidades',
            TypeNamePlural : 'oportunidades',
           
        },
    UI.LineItem#OVPEMPRESAS : [
    {
        $Type : 'UI.DataField',
        Label : 'Cliente',
        Value : Empresas.NombreEmpresa
    },
    {
        $Type : 'UI.DataField',
        Label : 'Fecha inicio',
        Value : numeroDocumento
    },
   
]

) ;
    
    


