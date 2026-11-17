#pragma once

#include "ArduCopterFirmwarePlugin.h"

class AutoPilotPlugin;
class Vehicle;

/// Plugin de firmware para ArduCopter. Hereda todo el comportamiento estandar
/// de ArduCopter y solo reemplaza el plugin de autopiloto por el nuestro.
class CustomFirmwarePlugin : public ArduCopterFirmwarePlugin
{
    Q_OBJECT

public:
    CustomFirmwarePlugin();

    // FirmwarePlugin overrides
    AutoPilotPlugin *autopilotPlugin(Vehicle *vehicle) const final;
};
