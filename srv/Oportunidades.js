const cds = require('@sap/cds');

module.exports = async (srv) => {
    const { Oportunidades } = cds.entities('CatalogService');

    srv.before('CREATE', Oportunidades, async (req) => {
        const { FechaInicio, FechaFin } = req.data;

        const hoy = new Date(); // Fecha actual
        hoy.setHours(0, 0, 0, 0); // Limpiar la parte de la hora para comparar solo fechas

        // Validar que la FechaInicio no sea posterior a la fecha actual
        if (FechaInicio && new Date(FechaInicio).getTime() > hoy.getTime()) {
            req.reject(400, 'La fecha de inicio no puede ser posterior a la fecha actual.');
        }

        // Validar que la FechaFin no sea anterior a la FechaInicio
        if (FechaFin) {
            const fechaInicioObj = new Date(FechaInicio);
            const fechaFinObj = new Date(FechaFin);

            if (fechaFinObj.getTime() < fechaInicioObj.getTime()) {
                req.reject(400, 'La fecha de fin no puede ser anterior a la fecha de inicio.');
            }

            // Validar que la FechaFin no sea la misma que la FechaInicio
            if (fechaFinObj.getTime() === fechaInicioObj.getTime()) {
                req.reject(400, 'La fecha de fin no puede ser la misma que la fecha de inicio.');
            }
        }
    });
};

