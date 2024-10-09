const cds = require('@sap/cds');

module.exports = async (srv) => {
    const { Consultores } = cds.entities('CatalogService');

    srv.before('CREATE', Consultores, async (req) => {
        const { NombreConsultor, ApellidoConsultor, CedulaConsultor } = req.data;

        // Validar que el campo NombreConsultor no esté vacío y que no contenga números
        if (!NombreConsultor || NombreConsultor.trim() === '') {
            req.reject(400, 'El nombre del consultor no puede estar vacío');
        } else if (!/^[a-zA-Z\s]+$/.test(NombreConsultor)) {
            req.reject(400, 'El nombre del consultor solo puede contener letras');
        }

        // Validar que el campo ApellidoConsultor no esté vacío y que no contenga números
        if (!ApellidoConsultor || ApellidoConsultor.trim() === '') {
            req.reject(400, 'El apellido del consultor no puede estar vacío');
        } else if (!/^[a-zA-Z\s]+$/.test(ApellidoConsultor)) {
            req.reject(400, 'El apellido del consultor solo puede contener letras');
        }

        // Validar que el campo CedulaConsultor no esté vacío y que solo contenga números
        if (!CedulaConsultor || CedulaConsultor.trim() === '') {
            req.reject(400, 'La cédula del consultor no puede estar vacía');
        } else if (!/^\d+$/.test(CedulaConsultor)) {
            req.reject(400, 'La cédula del consultor solo puede contener números');
        }

        const existeConsultor = await SELECT.one.from(Consultores).where({ CedulaConsultor });

        if (existeConsultor) {
            req.reject(400, 'Ya existe un consultor con la misma cédula');
        }

        
    });
};
