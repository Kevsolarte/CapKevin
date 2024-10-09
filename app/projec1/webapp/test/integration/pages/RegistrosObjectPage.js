sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'com.proyectoregistro.projec1',
            componentId: 'RegistrosObjectPage',
            contextPath: '/Registros'
        },
        CustomPageDefinitions
    );
});