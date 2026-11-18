#include "CustomAutoPilotPlugin.h"
#include "QGCCorePlugin.h"
#include "VehicleComponent.h"

#include <QtCore/QStringList>

// dronesargentina customizacion componentes visibles

// Componentes de Configure visibles (nombre de la clase C++).
// Cualquier componente que no este en esta lista queda oculto.
static const QStringList kVisibleComponents = {
    QStringLiteral("APMRadioComponent"),
    QStringLiteral("APMSensorsComponent"),
    QStringLiteral("APMFlightSafetyComponent"),
};

// true:  con Advanced Mode activado se muestran todos los componentes.
// false: la lista blanca se aplica siempre.
static constexpr bool kShowAllInAdvancedMode = true;

CustomAutoPilotPlugin::CustomAutoPilotPlugin(Vehicle *vehicle, QObject *parent)
    : APMAutoPilotPlugin(vehicle, parent)
{
    (void) connect(QGCCorePlugin::instance(), &QGCCorePlugin::showAdvancedUIChanged, this, &CustomAutoPilotPlugin::_advancedChanged);
}

void CustomAutoPilotPlugin::_advancedChanged(bool)
{
    _filteredComponents.clear();
    emit vehicleComponentsChanged();
}

const QVariantList &CustomAutoPilotPlugin::vehicleComponents()
{
    // La clase base crea todos los componentes (y los necesita internamente)
    const QVariantList &allComponents = APMAutoPilotPlugin::vehicleComponents();

    if constexpr (kShowAllInAdvancedMode) {
        if (QGCCorePlugin::instance()->showAdvancedUI()) {
            return allComponents;
        }
    }

    if (_filteredComponents.isEmpty()) {
        for (const QVariant &variant : allComponents) {
            const VehicleComponent *component = variant.value<VehicleComponent*>();
            if (component && kVisibleComponents.contains(QString::fromLatin1(component->metaObject()->className()))) {
                _filteredComponents.append(variant);
            }
        }
    }

    return _filteredComponents;
}
