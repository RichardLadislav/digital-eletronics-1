# Running text on 7-seg displays / Běžící text

### Členové týmu

* Radim Macho (responsible for xxx)
* Richard Ladislav (responsible for xxx)
* Vilém Pecháček (responsible for xxx)

### Obsah

* [Cíle projektu](#objectives)
* [Popis hardwaru](#hardware)
* [Popis VHDL modulů a simulace](#modules)
* [Popis TOPu a simulace](#top)
* [Video](#video)
* [Diskuze o výsledcích](#discussion)
* [Reference](#references)

<a name="objectives"></a>

## Cíle projektu

Cílem našeho projektu bylo naprogramovat běžící text na 7 segmentových displejích programovatelné desky Nexys A7-5OT pomocí jazyka VHDL. 
K vývoji kódu jsme použili vývojové prostředí Vivado 2020. Naším cílem bude zobrazení slova "*de1 Hello*" pomocí osmi 7 segmentových displejů. Slovo mělo defaultně písmeno po písmenu přeblíkavat na displeji směrem zprava doleva. Docíli se tak efektu "běžícího" textu. Do programu jsme implementovali možnost restartu textu, kdy po stisknutí prostředního tlačítka na desce dojde k navrácení slova do počátečního stavu.

<a name="hardware"></a>

## Popis hardwaru

K realizaci projektu využijeme programovatelnou desku Nexys A7-50T. Na desce využijeme osm 7 segmentových displejů **(1)** a pět tlačítek **(5)**. Deska se napájí a programuje micro USB kabelem **(3)** připojeným k počítači. Vývojové prostředí Vivado 2020 nám umožňuje program zkompilovat a nahrát do desky.

![nexys](images/nexys-a7-50t.jpg)

Deska Nexys A7 obsahuje dva čtyřmístné sedmisegmentové LED displeje se společnou anodou, nakonfigurované tak, aby se chovaly jako jeden osmimístný displej. Každá z osmi číslic se skládá ze sedmi segmentů uspořádaných do vzoru viz obr. níže, přičemž v každém segmentu je zabudovaná LED. Segmentové LED diody lze rozsvítit jednotlivě, takže na číslici lze zobrazit kterýkoli ze 128 vzorů rozsvícením určitých segmentů LED a ponecháním ostatních tmavých.

Pro rozsvícení segmentu by měla být anoda ve stavu high, zatímco katoda by měla být ve stavu low. Protože však Nexys A7 používá tranzistory k přivedení dostatečného proudu do společného anodového uzlu, aktivace anody jsou invertované. Proto jsou oba signály AN0..7 a CA..G/DP, když jsou aktivní, ve stavu low.

<p align="center">
  <img src="images/segment.png">
</p>

Při vytváření jednotlivých písmen jsme se inspirovali níže přiloženým návrhem 7 segmentové abecedy, kterou vytvořil uživatel WH1T3_No1SE na platformě Steam.

<p align="center">
  <img src="images/seg_alphabet.png">
</p>

<a name="modules"></a>

## Popis VHDL modulů a simulace

Write your text here.

<a name="top"></a>

## Popis TOPu a simulace

Write your text here.

<a name="video"></a>

## Video

Write your text here

<a name="references"></a>

## Diskuze o výsledcích

Vytyčených cílů se nám bohužel nepodařilo dosáhnout. Na 7 segmentovém displeji jsme zobrazili slova "*de1 Hello*", avšak nepodařilo se nám zprovoznit posouvání textu. Proč? Aspoň máme reset no ne?

<a name="discussion"></a>
## Reference
>>smazat : slouží pro odkazy na kód?
1. https://digilent.com/reference/programmable-logic/nexys-a7/reference-manual?redirect=1
2. https://steamcommunity.com/sharedfiles/filedetails/?id=1701428356
