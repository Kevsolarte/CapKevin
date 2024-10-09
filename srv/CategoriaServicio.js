const cds = require('@sap/cds');

module.exports = async (srv) => {
    const { CategoriaServicio, Servicio } = cds.entities('CatalogService');

    srv.before('CREATE', CategoriaServicio, async (req) => {
        console.log('pase');
        const { NombreCategoria, Descripicion } = req.data;

        if (!NombreCategoria || NombreCategoria.trim() === '') {
            req.reject(400, 'El nombre de la categoría no puede estar vacío');
        }

        if (!Descripicion || Descripicion.length < 10) {
            req.reject(400, 'La descripción debe tener al menos 10 caracteres');
        }
        const existeCategoria = await SELECT.one.from(CategoriaServicio).where({ NombreCategoria });
        if (existeCategoria) {
            req.reject(400, 'Ya existe una categoría con el mismo nombre');
        }
 });

 srv.before('CREATE', CategoriaServicio, async (req) => {
    const { NombreCategoria, Servicio } = req.data;

    // Validación para el Nombre de la categoría
    if (!NombreCategoria || NombreCategoria.trim() === '') {
        req.reject(400, 'El nombre de la categoría no puede estar vacío.');
    }

    // Validación dentro de la composición Servicios
    if (Servicio && Servicio.length > 0) {
        const nombres = new Set();

        for (const servicio of Servicio) {
            // Validación: Verificar si el nombre del servicio está vacío primero
            if (!servicio.Nombre || servicio.Nombre.trim() === '') {
                req.reject(400, 'El nombre del servicio no puede estar vacío.');
            }

            // Validación: Verificar nombres duplicados dentro de la composición
            if (nombres.has(servicio.Nombre)) {
                req.reject(400, `Ya existe un servicio con el nombre "${servicio.Nombre}" dentro de la categoría.`);
            }
            nombres.add(servicio.Nombre);

            // Validación: Verificar si ya existe un servicio con el mismo nombre en la base de datos
            const existeServicio = await cds.transaction(req).run(
                SELECT.one.from('CatalogService.Servicios').where({ Nombre: 'sap' })
            );

            if (existeServicio) {
                req.reject(400, `Ya existe un servicio con el nombre "${servicio.Nombre}" en otra categoría.`);
            }
        }
    }
});

};
