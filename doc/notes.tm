<TeXmacs|1.99.7>

<style|<tuple|article|maxima>>

<\body>
  <doc-data|<doc-title|Solar power for my sister's robot.
  >|<doc-author|<\author-data|<author-name|Harkaitz Agirre Ezama>>
    \;
  </author-data>>|<doc-date|<date|>>>

  <\table-of-contents|toc>
    1<space|2spc>Design parameters. <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1>

    2<space|2spc>Component selection. <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2>

    <with|par-left|1tab|2.1<space|2spc>LT3652 - Pin notes and usage.
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <with|par-left|1tab|2.2<space|2spc>LT3652 - Calculus.
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>
  </table-of-contents>

  \;

  \;

  <section|Design parameters.>

  <block|<tformat|<table|<row|<cell|Battery.>|<cell|>|<cell|Solar
  panels>|<cell|>>|<row|<cell|Tech>|<cell|NiCd>|<cell|Model>|<cell|1597-1417-ND>>|<row|<cell|<math|N<rsub|series>>>|<cell|3>|<cell|<math|V<rsub|OC>>>|<cell|8.2>>|<row|<cell|<math|V<rsub|max>>>|<cell|1.5V>|<cell|N>|<cell|4>>|<row|<cell|>|<cell|>|<cell|<math|V<rsub|mpp>>>|<cell|5.5V>>|<row|<cell|>|<cell|>|<cell|<math|I<rsub|mpp>>>|<cell|100mA>>>>>

  \;

  <\session|maxima|default>
    <\folded-io>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|folded-io>
      Nc:4; Nb:3; Vout_max:1.55*Nb; Vmpp:5.5*Nc; Vin_max:8.2*Nc;
    <|folded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
      >>4>>

      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >>3>>

      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o15>)
      >>4.65>>

      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o16>)
      >>22.0>>

      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o17>)
      >>32.8>>
    </folded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>36) >
    <|unfolded-io>
      Vout_max
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o36>)
      >>4.65>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>37) >
    <|input>
      \;
    </input>
  </session>

  <block|<tformat|<table|<row|<cell|DC/DC IC
  >|<cell|(Maxima-\<gtr\>evaluation switch)>>|<row|<cell|<math|V<rsub|IN><around*|(|max|)>>>|<cell|<script-output|maxima|default|Vin_max|
  <math|32.8>> >>|<row|<cell|<math|V<rsub|OUT><around*|(|max|)>>>|<cell|<script-output|maxima|default|Vout_max|
  <math|4.65>>>>>>>

  <section|Component selection.>

  <block|<tformat|<table|<row|<cell|DC/DC
  IC>|<cell|<hlink|http://www.linear.com/parametric/Energy_Harvesting|>>>|<row|<cell|LT3652>|<cell|<math|Vin<around*|(|min|)>=4.95>
  <math|V<rsub|IN><around*|(|max|)>=32V>>>|<row|<cell|>|<cell|<hlink|http://cds.linear.com/docs/en/datasheet/3652fe.pdf|http://cds.linear.com/docs/en/datasheet/3652fe.pdf>>>>>>

  \;

  <\session|maxima|default>
    \;
  </session>

  <subsection|LT3652 - Pin notes and usage.>

  <\description>
    <item*|01 - <math|V<rsub|IN>>>Connect solar cells in series to here.

    <item*|02 - <math|V<rsub|INreg>>>When in <math|V<rsub|IN>=V<rsub|mpp>>,
    this must be <math|2.7V>, this way we put the solar panels at maximun
    power.

    <math|2.7=V<rsub|mpp>*<frac|Rr1*Rr2|Rr1+Rr2>>

    <item*|<math|03-<wide|SHDN|\<bar\>>>>Pull up <math|V<rsub|in>>.

    <item*|<math|04-<wide|CHRG|\<bar\>>>>Pull up <math|V<rsub|in>>.

    <item*|<math|05-<wide|FAULT|\<bar\>>>>Pull up <math|V<rsub|in>>.

    <item*|06 - TIMER>OC

    <item*|<math|07-V<rsub|FB>>>When the voltage here is 3,3V input is open
    circuited.

    Rb1(BAT-<math|V<rsub|FB>>)<space|1em>=<math|V<rsub|BAT>\<bullet\>*2.5**\<bullet\>10<rsup|5>>/3.3

    Rb2(<math|V<rsub|FB>>-GND) =<math|<frac|R<rsub|b1>\<bullet\>2.5\<bullet\>10<rsup|5>|R<rsub|b1>-<around*|(|2.5\<bullet\>10<rsup|5>|)>>>

    <item*|08 - NTC>Battery temperature, for Lithium, ignore.

    <item*|09 - BAT>Output voltage, set to 5V. C=10\<mu\>F to ground. The
    weird characteristic of <math|NiCd> and <math|NiMH> at the final of the
    charge is handled by this IC. (Sistemas electronicos de alimentacion
    class notes, page 57)

    \PThe auto-restart feature initiates a new charging cycle when the
    voltage at the VFB pin falls 2.5% below the float voltage reference.\Q

    <item*|10 - SENSE>Set maximun charge current throw a resistor,
    shortcircuit this to BAT to ignore it.

    <item*|11 - BOOST>

    <item*|12 - SW>

    Both BOOST and SW are used for putting the inductor, diode and capacitor
    of the boost converter. To reduce ripple put a big L.

    <math|L<rsub|SW-BAT>=10\<mu\>H> <math|D<rsub|BAT-\<gtr\><math-up|BOOST>>>=1N914<space|1em><math|C<rsub|<math-up|BOOST-SW>>\<gtr\>1\<mu\>F>

    \;

    <item*|13- GND>
  </description>

  \;

  <subsection|LT3652 - Calculus.>

  <\session|maxima|default>
    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>37) >
    <|unfolded-io>
      Rb1:(Vout_max)*2.5*(10^5)/3.3;
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o37>)
      >>352272.7272727273>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>38) >
    <|unfolded-io>
      Rb2:(Rb1*2.5*10^5)/(Rb1-(2.5*10^5));
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o38>)
      >>861111.111111111>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>34) >
    <|unfolded-io>
      float(solve([2.7=Rr2/(Rr1+Rr2)*Vmpp,Rr1=1000000],[Rr1,Rr2]));
    <|unfolded-io>
      \;

      rat: replaced 2.7 by 27/10 = 2.7

      \;

      rat: replaced -22.0 by -22/1 = -22.0

      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o34>)
      >><around*|[|<around*|[|<with|math-font-family|rm|Rr1>=1000000.0,<with|math-font-family|rm|Rr2>=139896.3730569948|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>35) >
    <|unfolded-io>
      Vmpp
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o35>)
      >>22.0>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>36) >
    <|input>
      \;
    </input>
  </session>
</body>

<\initial>
  <\collection>
    <associate|prog-scripts|maxima>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|3>>
    <associate|auto-2|<tuple|2|3>>
    <associate|auto-3|<tuple|2.1|3>>
    <associate|auto-4|<tuple|2.2|4>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Design
      parameters.> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Component
      selection.> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>LT3652 - Pin notes and
      usage. <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>LT3652 - Calculus.
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>
    </associate>
  </collection>
</auxiliary>