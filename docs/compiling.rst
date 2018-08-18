Handling Errors at Compile Time
===============================

Sometimes, for some reason or another, you need to do something in your schematic that raises an error at compilation time. The most common case you'll run into is when you need to connect an input or output pin to a bidirectional pin (say, a pin coming from a microcontroller). This will return an error in Altium, because you've potentially created a situation either where you have two outputs driving the same line (bad) or two inputs with no driving source which are left floating (less bad, but bad).

From a practical point of view, neither of these are situations you actually want in your real circuit. But, perhaps you know that you'll only be operating your microcontroller GPIO pin in input mode, so connecting it to an output makes sense. This is still dangerous (make sure your software person knows it can only be an input), and in some cases it might make sense to throw a current limiting resistor in series as a failsafe, like in the image below. This will remove the error in Altium and would be the correct way to deal with this problem. For the two inputs case, consider connecting a pull-up or pull-down resistor to the line to define a default state.

In either case, the fact that Altium is giving you an error is *telling you something important* about your circuit, and you would do well to understand how you would fix that error under normal circumstances. That said, there are still cases where you might understand that there's an error, but are OK with it and just want to move ahead

Showing Suppressed Messages
---------------------------

Under **Project > Project Options > Error Reporting** go ahead and enable the "Report Suppressed Violations in Messages Panel" checkbox at the bottom of the window. This will allow you to see the messages at compile time that you've suppressed, and give anyone checking over your work the chance to catch any potential errors before sending out the design.

The Generic No ERC
------------------

The Generic No ERC (third from the right in the schematic toolbar, shown as a red "X") is your go-to for handling compilation errors you want to suppress on a case-by-case basis. This will prevent you from bulk suppressing any errors unknowingly. Either select the Generic No ERC tool from the toolbar, or right click on a message in the message panel and select "Place specific No ERC for this violation...". Then, place the red "X" on the net or line that's giving you the error.

This will suppress any and all errors on this net by default, which might have unintended consequences. I would recommend going into the "Properties" panel for that ERC and selecting "Specific Violations" from the "Suppressed Violations" tab. This will give you the option to only suppress the violations you want to waive, and still warn you if other, real errors occur on that net later on.
