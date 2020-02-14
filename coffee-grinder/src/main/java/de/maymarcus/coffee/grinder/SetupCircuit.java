package de.maymarcus.coffee.grinder;

import com.pi4j.io.gpio.GpioController;
import com.pi4j.io.gpio.GpioFactory;
import com.pi4j.io.gpio.GpioPinDigitalInput;
import com.pi4j.io.gpio.GpioPinDigitalOutput;
import com.pi4j.io.gpio.event.GpioPinListenerDigital;
import org.slf4j.Logger;
import org.springframework.stereotype.Component;

import static com.pi4j.io.gpio.PinMode.DIGITAL_INPUT;
import static com.pi4j.io.gpio.PinMode.DIGITAL_OUTPUT;
import static com.pi4j.io.gpio.PinPullResistance.PULL_DOWN;
import static com.pi4j.io.gpio.PinPullResistance.PULL_UP;
import static com.pi4j.io.gpio.PinState.HIGH;
import static com.pi4j.io.gpio.PinState.LOW;
import static com.pi4j.io.gpio.RaspiPin.GPIO_08;
import static com.pi4j.io.gpio.RaspiPin.GPIO_09;
import static org.slf4j.LoggerFactory.getLogger;

@Component
public class SetupCircuit {

    private static final Logger LOG = getLogger(SetupCircuit.class);
    private final GpioController gpio;

    public SetupCircuit() {
        LOG.info("Setting up circuit");

        gpio = GpioFactory.getInstance();

        GpioPinDigitalOutput grinder = gpio.provisionDigitalOutputPin(GPIO_08, "grinder", LOW);
        grinder.setShutdownOptions(true, LOW, PULL_DOWN, DIGITAL_OUTPUT);

        GpioPinDigitalInput button = gpio.provisionDigitalInputPin(GPIO_09, "button", PULL_UP);
        button.setShutdownOptions(true, HIGH, PULL_UP, DIGITAL_INPUT);

        button.setDebounce(300);
        button.addListener((GpioPinListenerDigital) (e) -> {
            LOG.info("pulse start");
            grinder.pulse(3000);
            LOG.info("pulse end");
        });
    }
}
