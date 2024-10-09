sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'com.proyectoregistro.projec1',
            componentId: 'RegistrosList',
            contextPath: '/Registros'
        },
        CustomPageDefinitions
    );
});