void main() {}

///ինչ ա design system ը ?
///Դիզայն սիստեմը դա էլեմենտների հավաքածու ա, որը կարող ա վերաօգտագործվել տարբեր կոմբինացիաներով.
///
///ATOMIC DESIGN : creator BRAD FOST
///
/// ATOMS
/// Atoms are components that cannot be divided into smaller elements
///
/// MOLECULES
/// Molecules are functional units of several atoms, but they do not have multiple responsibilities.
/// For instance, an icon, a text, and a button inside a card are modal, and it is a molecule because it retains responsibility.
///
/// ORGANISMS
/// Organisms are elements composed of the union of several molecules and atoms. These can have different responsibilities and
/// generate multiple events. An example would be the header, navbar, sliders, etc.
///
/// TEMPLATES
/// Templates define the order and configure the arrangement of elements.
///
/// PAGES
/// They are different screens exposed to the end-user.
///
/// TOKENS
/// We still had a problem, how could we make the colors, shadows, animations, fonts, and iconographies used along with the whole project standard?
/// We decided to have all these elements in a layer that we call tokens. These are the basis of atoms.
/// The advantage is changing some color of mark, font, shadow, or animation; All elements are updated automatically with the new values.
///
/// FOUNDATION
/// No component should directly depend on tokens; remember that its definition should not be tied to any.
/// Therefore, we establish a bridge between the token and the widget definition in the Foundation layer.

