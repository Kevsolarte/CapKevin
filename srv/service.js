const { entities } = require('@sap/cds');
const cds = require('@sap/cds');
const { log } = require('@sap/cds/lib/env/defaults');
const CategoriaServicio = require('./CategoriaServicio')
const numeroDocumento = require ('./numeroDocumento')
const CrearRegistro = require ('./CrearRegistro')
const Consultores = require ('./Consultores')
const Oportunidades = require ('./Oportunidades')






module.exports = async (srv) => {

    await CategoriaServicio(srv);
    await numeroDocumento(srv);
    await CrearRegistro(srv);
    await Consultores(srv);
    await Oportunidades(srv);
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

     
    const { BusinessPartner } = cds.entities;

    // Hook para inicializar los objetos Persona y Empresa si no existen
    srv.before('NEW', 'CatalogService.BusinessPartner.drafts', async (req) => {
        req.data.Persona ??= {};
        req.data.Empresas ??= {};
    });

    // Hook para actualizar el nombre de la empresa en BusinessPartner
    srv.before('UPDATE', 'CatalogService.BusinessPartnerEmpresa.drafts', async (req) => {
        if (req.data.NombreEmpresa) {
            await cds.transaction(req).run(
                UPDATE('CatalogService.BusinessPartner.drafts').set({
                    Nombre: req.data.NombreEmpresa
                })
            );
        }
    });

    // Hook para crear un nuevo BusinessPartner
    srv.before('CREATE', 'CatalogService.BusinessPartner', async (req) => {
        console.log(req.data);

        // Concatenar Nombre y Apellido si existen en Persona
        if (req.data.Persona.Nombre && req.data.Persona.Apellido) {
            req.data.Nombre = `${req.data.Persona.Nombre} ${req.data.Persona.Apellido}`;
        }

        // Validar duplicación de numeroDocumento
        const { numeroDocumento } = req.data;
        if (numeroDocumento) {
            const existeDocumento = await SELECT.one
                .from('CatalogService.BusinessPartner')
                .where({ numeroDocumento });

            if (existeDocumento) {
                req.reject(400, 'Ya existe un Business Partner con el mismo número de documento.');
            }
        }
    });

    srv.before(['CREATE', 'UPDATE'], 'CatalogService.BusinessPartner', async (req) => {
        
        
        if (req.data.Persona && req.data.Persona.FechaNacimiento) {
            const fechaNacimiento = new Date(req.data.Persona.FechaNacimiento);
            const fechaActual = new Date();
            fechaActual.setHours(0, 0, 0, 0); // Para comparar solo la fecha, ignorar la hora
    
            // Verificar si la FechaNacimiento es la fecha actual
            if (fechaNacimiento.getTime() === fechaActual.getTime()) {
                req.reject(400, 'La fecha de nacimiento no puede ser la fecha actual.');
            }
            
            // Verificar si la FechaNacimiento es una fecha futura
            if (fechaNacimiento > fechaActual) {
                req.reject(400, 'La fecha de nacimiento no puede ser una fecha futura.');
            }
        }
    
    
    
    
    
    
    
    
    })
    
    srv.before('UPDATE', 'BusinessPartner.drafts', async (req) => {
       

        
        

        // Validar si el tipo de persona es 'Persona'
    if (Tipopersona_code === 'Persona' && Persona) {
        // Validaciones para Nombre
        if (!Persona.Nombre || Persona.Nombre.trim() === '') {
            req.reject(400, 'El nombre no puede estar vacío.');
        } else if (!/^[A-Za-z\s]+$/.test(Persona.Nombre)) {
            req.reject(400, 'El nombre solo puede contener letras.');
        }

        // Validaciones para Apellido
        if (!Persona.Apellido || Persona.Apellido.trim() === '') {
            req.reject(400, 'El apellido no puede estar vacío.');
        } else if (!/^[A-Za-z\s]+$/.test(Persona.Apellido)) {
            req.reject(400, 'El apellido solo puede contener letras.');
        }

        // Validaciones para Número de Teléfono
        if (!Persona.Numerodetelefono || Persona.Numerodetelefono.trim() === '') {
            req.reject(400, 'El número de teléfono es obligatorio.');
        } else if (!/^\d+$/.test(Persona.Numerodetelefono)) {
            req.reject(400, 'El número de teléfono solo puede contener números.');
        }

        // Validaciones para Correo Electrónico
        if (!Persona.CorreoElectronico || Persona.CorreoElectronico.trim() === '') {
            req.reject(400, 'El correo electrónico es obligatorio.');
        }

        // Validaciones para Dirección
        if (!Persona.Direccion || Persona.Direccion.trim() === '') {
            req.reject(400, 'La dirección es obligatoria.');
        }
    }}
    

    )};





