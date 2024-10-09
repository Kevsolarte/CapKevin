const cds = require('@sap/cds');

module.exports = async (srv) => {
    const { numeroDocumento } = cds.entities('CatalogService');

    srv.before('CREATE', numeroDocumento, (req) => {
        const { numeroDocumento } = req.data;

        // Validar que el campo solo contenga números y tenga al menos 5 dígitos
        if(numeroDocumento){
        const isNumeric = /^\d+$/.test(numeroDocumento);

            if (!isNumeric) {
                req.reject(400, 'El número de documento solo debe contener dígitos numéricos');
            }
    
            if (numeroDocumento.length < 5) {
                req.reject(400, 'El número de documento debe tener al menos 5 dígitos');
            }

        }

    });
};

