#pragma once

#include "APMAutoPilotPlugin.h"

// dronesargentina

class Vehicle;

/// Plugin de autopiloto para ArduCopter. Toma la lista completa de componentes
/// de APMAutoPilotPlugin y muestra solo los de la lista blanca.
class CustomAutoPilotPlugin : public APMAutoPilotPlugin
{
    Q_OBJECT

public:
    explicit CustomAutoPilotPlugin(Vehicle *vehicle, QObject *parent = nullptr);

    const QVariantList &vehicleComponents() final;

private slots:
    /// Al entrar o salir del Advanced Mode cambia la lista de componentes
    void _advancedChanged(bool advanced);

private:
    QVariantList _filteredComponents;
};
