const { update } = require('@sap/cds')
const cds = require ('@sap/cds')
const { uuid } = require('@sap/cds/lib/utils/cds-utils')

module.exports = async ( srv ) => {
    const { cotizacion,cotizacionXOportunidad,ServicioPrestado,ServiciosXCliente } = cds.entities('CatalogService')

    srv.on('CrearRegistro', async (req) => {

        req.notify('Cotizacion Cerrada')

        const tx = cds.transaction(req);

        console.log(req.params[0].ID); 
        

       var S= await tx.run(SELECT.from(cotizacion).where({ID: req.params[0].ID}))
        var S2 = await tx.run(SELECT.from(cotizacionXOportunidad).where({to_cotizacion_ID: req.params[0].ID}))
       console.log(S);

       let ID= uuid();


       await tx.run(INSERT.into(ServicioPrestado).entries({
        ID: ID,
        Cliente_ID: req.params[0].ID
    }))
        await tx.run(UPDATE(cotizacion).set({Cerrado: true}).where({ID: req.params[0].ID}))
       for(record of S2) {

        console.log(record);
        await tx.run(INSERT.into(ServiciosXCliente).entries({
            ID: uuid(),
            to_servicio_ID: record.to_servicio_ID,
            to_ServicioPrestado_ID: ID,
        }))
       }





    })

}