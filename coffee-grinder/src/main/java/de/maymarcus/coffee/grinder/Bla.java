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
import static com.pi4j.io.gpio.RaspiPin.GPIO_02;
import static com.pi4j.io.gpio.RaspiPin.GPIO_04;
import static org.slf4j.LoggerFactory.getLogger;

@Component
public class Bla {

    private static final Logger LOG = getLogger(Bla.class);
    private final GpioController gpio;

    public Bla() {
        LOG.info("Bla created");

        gpio = GpioFactory.getInstance();
        GpioPinDigitalOutput grinder = gpio.provisionDigitalOutputPin(GPIO_04, "grinder", LOW);
        GpioPinDigitalInput button = gpio.provisionDigitalInputPin(GPIO_02, "button", PULL_UP);
        button.setDebounce(300);
        GpioPinListenerDigital buttonListener = (e) -> {
            grinder.pulse(3000);
        };
        button.addListener(buttonListener);

        grinder.setShutdownOptions(true, LOW, PULL_DOWN, DIGITAL_OUTPUT);
        button.setShutdownOptions(true, HIGH, PULL_UP, DIGITAL_INPUT);
    }

//    @PostConstruct
//    public void init() {
//        LOG.info("Bla.init");
//    }
}
