import { Dimensions } from "react-native";
const {
    width: SCREEN_WIDTH,
    height: SCREEN_HEIGHT,
} = Dimensions.get("window");

// sizes
const SIZES = {
    baseMargin: 10,
    buttonHeight: (SCREEN_WIDTH < SCREEN_HEIGHT ? SCREEN_HEIGHT : SCREEN_WIDTH) * 0.07,
    buttonRadius: 4,
    buttonWidth: (SCREEN_WIDTH < SCREEN_HEIGHT ? SCREEN_HEIGHT : SCREEN_WIDTH) * 0.4,
    doubleBaseMargin: 20,
    doubleSection: 50,
    horizontalLineHeight: 1,
    iconHeight: (SCREEN_WIDTH < SCREEN_HEIGHT ? SCREEN_HEIGHT : SCREEN_WIDTH) * 0.05,
    iconWidth: (SCREEN_WIDTH < SCREEN_HEIGHT ? SCREEN_HEIGHT : SCREEN_WIDTH) * 0.05,
    marginHorizontal: 10,
    marginVertical: 10,
    navBarHeight: (SCREEN_WIDTH < SCREEN_HEIGHT ? SCREEN_HEIGHT : SCREEN_WIDTH) * 0.1,
    screenHeight: SCREEN_WIDTH < SCREEN_HEIGHT ? SCREEN_HEIGHT : SCREEN_WIDTH,
    screenWidth: SCREEN_WIDTH < SCREEN_HEIGHT ? SCREEN_WIDTH : SCREEN_HEIGHT,
    icons: {
        large: 45,
        medium: 30,
        section: 25,
        small: 20,
        smallMargin: 5,
        tiny: 15,
        xl: 50,
    },
    images: {
        large: 60,
        logo: 200,
        medium: 40,
        small: 20,
    },
    textHeight: (SCREEN_WIDTH < SCREEN_HEIGHT ? SCREEN_HEIGHT : SCREEN_WIDTH) * 0.05,
};

// colors

const COLORS = {
    active: "rgba(255, 255, 255, 0.7)",
    disabled:"rgba(255, 255, 255, 0.35)",
    black: "#000000",
    white: "#FFFFFF",
    transparent: "transparent",
    facebook: "#3b5998",
    silver: "#F7F7F7",
    steel: "#CCCCCC",
    error: "#a94442",
    windowTint: "rgba(0, 0, 0, 0.4)",
    panther: "#161616",
    charcoal: "#595959",
    coal: "#2d2d2d",
    bloodOrange: "#fb5f26",
    snow: "white",
    ember: "rgba(164, 0, 48, 0.5)",
    fire: "#e73536",
    drawer: "rgba(30, 30, 29, 0.95)",
    eggplant: "#251a34",
    border: "#483F53",
    banner: "#5F3E63",
    text: "#E0D7E5",
    background: "#3E3E3E",
    primary: "#F5F5F5",
    secondary: "#F5F5F5", // à changer later
    tertiary: "#F5F5F5", //à changer later 
};

const FONTS = {
    h1: 38,
    h2: 34,
    h3: 30,
    h4: 26,
    h5: 20,
    h6: 18,
    input: 18,
    regular: 17,
    medium: 14,
    small: 12,
    tiny: 8.5,
};

const STYLES = {
    row: {
        flexDirection: "row",
    },
    center: {
        alignItems: "center",
        justifyContent: "center",
    },
    title: {
        fontSize: FONTS.h1,
        fontWeight: "bold",
        color: COLORS.black,
    },
    subtitle: {
        fontSize: FONTS.h2,
        fontWeight: "bold",
        color: COLORS.black,
        textAlign: "center",
        // marginTop: "0.5rem",
        marginBottom: 16,
    },
    header: {
        backgroundColor: COLORS.primary,
    },
    headerTitle: {
        color: COLORS.black,
    },
    headerBackTitle: {
        color: COLORS.black,
    },
    headerTintColor: {
        color: COLORS.black,
    },
    headerIconStyle: {
        tintColor: COLORS.black,
    },

    // Text Styles
    text: {
        color: COLORS.black,
        fontSize: FONTS.regular,
    },
    textBold: {
        fontWeight: "bold",
    },
    textWhite: {
        color: COLORS.white,
    },
    textGray: {
        color: COLORS.charcoal,
    },
    textInput: {
        height: SIZES.textHeight,
        color: COLORS.black,
        width: SIZES.screenWidth - 40,
        borderColor: COLORS.black,
        borderWidth: 1,
        borderRadius: 4,
        padding: 10,
        marginBottom: 16,
        backgroundColor: COLORS.white,
    },
    textInputTitle: {
        color: COLORS.black,
        fontSize: FONTS.medium,
        fontWeight: "bold",
    },
    textInputWrapper: {
        borderBottomWidth: 1,
        borderBottomColor: COLORS.silver,
        marginBottom: SIZES.baseMargin,
    },
    textInputError: {
        borderBottomColor: COLORS.error,
    },
    textInputErrorText: {
        color: COLORS.error,
    },
    textInputDisabled: {
        color: COLORS.steel,
    },
    textArea: {
        height: 100,
        justifyContent: "flex-start",
    },
    textAreaWrapper: {
        borderBottomWidth: 1,
        borderBottomColor: COLORS.silver,
        marginBottom: SIZES.baseMargin,
    },
    textAreaError: {
        borderBottomColor: COLORS.error,
    },
    textAreaErrorText: {
        color: COLORS.error,
    },
    textAreaDisabled: {
        color: COLORS.steel,
    },
    textAreaTitle: {
        color: COLORS.black,
        fontSize: FONTS.medium,
        fontWeight: "bold",
    },

    // Button Styles
    button: {
        height: SIZES.buttonHeight,
        // backgroundColor: COLORS.primary,
        backgroundColor: COLORS.facebook,
        borderColor: COLORS.primary,
        borderWidth: 1,
        borderRadius: SIZES.buttonRadius,
        justifyContent: "center",
        alignItems: "center",
    },
    buttonDisabled: {
        backgroundColor: COLORS.silver,
        borderColor: COLORS.silver,
    },
    buttonPrimary: {
        backgroundColor: COLORS.primary,
        borderColor: COLORS.primary,
    },
    buttonSecondary: {
        backgroundColor: COLORS.secondary,
        borderColor: COLORS.secondary,
    },
    buttonTertiary: {
        backgroundColor: COLORS.tertiary,
        borderColor: COLORS.tertiary,
    },

    // Card Styles
    card: {
        backgroundColor: COLORS.white,
        borderRadius: SIZES.buttonRadius,
        shadowColor: COLORS.black,
        shadowOffset: {
            width: 0,
            height: 2,
        },
        shadowOpacity: 0.1,
        shadowRadius: 1.5,
        elevation: 3,
    },
    cardHeader: {
        padding: SIZES.baseMargin,
        borderBottomWidth: 1,
        borderBottomColor: COLORS.silver,
    },
    cardContent: {
        padding: SIZES.baseMargin,
    },
    cardFooter: {
        padding: SIZES.baseMargin,
        borderTopWidth: 1,
        borderTopColor: COLORS.silver,
    },
    cardTitle: {
        fontSize: FONTS.h4,
        fontWeight: "bold",
        color: COLORS.black,
    },
    cardSubtitle: {
        fontSize: FONTS.h6,
        color: COLORS.charcoal,
    },
    cardImage: {
        width: "100%",
        height: 150,
        borderRadius: SIZES.buttonRadius,
    },
    cardFullImage: {
        width: "100%",
        height: 250,
        borderRadius: SIZES.buttonRadius,
    },
    cardNoRadius: {
        borderRadius: 0,
    },
    cardNoShadow: {
        shadowColor: COLORS.transparent,
        shadowOffset: {
            width: 0,
            height: 0,
        },
        shadowOpacity: 0,
        shadowRadius: 0,
        elevation: 0,
    },
    cardNoBorder: {
        borderWidth: 0,
    },


    // Icon Styles
    icon: {
        width: 26,
        height: 26,
    },
    iconSmall: {
        width: SIZES.icons.tiny,
        height: SIZES.icons.tiny,
    },
    iconMedium: {
        width: 32,
        height: 32,
    },
    iconLarge: {
        width: 45,
        height: 45,
    },
    iconButton: {
        width: SIZES.icons.medium,
        height: SIZES.icons.medium,

    },
    iconButtonSmall: {
        width: SIZES.icons.small,
        height: SIZES.icons.small,
    },
    iconButtonMedium: {
        width: SIZES.icons.large,
        height: SIZES.icons.large,
    },
    iconButtonLarge: {
        width: SIZES.icons.xl,
        height: SIZES.icons.xl,
    },



    // Image Styles

    // Form Styles
    form: {
        width: "100%",
    },
    formGroup: {
        marginBottom: SIZES.baseMargin,
    },
    formLabel: {
        color: COLORS.black,
        fontSize: FONTS.medium,
        fontWeight: "bold",
    },
    formInput: {
        height: SIZES.textHeight,
        color: COLORS.black,
        width: SIZES.screenWidth - 40,
        borderColor: COLORS.black,
        borderWidth: 1,
        borderRadius: 4,
        padding: 10,
        // marginBottom: 16,
    },

    // Input Styles

    // Layout Styles

    // List Styles

    // Modal Styles

    // Navigation Styles
    navigation: {
        backgroundColor: COLORS.white,
    },
    navigationTitle: {
        color: COLORS.black,
        fontSize: FONTS.h4,
        fontWeight: "bold",
    },
    navigationSubtitle: {
        color: COLORS.black,
        fontSize: FONTS.h6,
    },
    navigationButton: {
        color: COLORS.black,
    },
    navigationButtonIcon: {
        color: COLORS.black,
    },
    navigationButtonText: {
        color: COLORS.black,
    },
    navigationButtonDisabled: {
        color: COLORS.silver,
    },

    // Tab Styles

    // Toast Styles

    // Spinner Styles

    // Switch Styles

    // Picker Styles

    // Radio Styles

    // Checkbox Styles

    // Slider Styles

    // Searchbar Styles
    searchBar: {
        backgroundColor: COLORS.white,
        borderTopWidth: 0,
        borderBottomWidth: 0,
        height: 50,
    },
    searchBarInput: {
        backgroundColor: COLORS.silver,
        borderRadius: 10,
        height: 40,
        fontSize: FONTS.regular,
        color: COLORS.black,
    },
    searchBarIcon: {
        color: COLORS.black,
    },
    searchBarCancel: {
        color: COLORS.black,
    },
    searchBarClear: {
        color: COLORS.black,
    },
    searchBarClearIcon: {
        color: COLORS.black,
    },
    searchBarPlaceholder: {
        color: COLORS.black,
    },
    searchBarInputContainer: {
        backgroundColor: COLORS.silver,
        borderRadius: 10,
        height: 40,
    },
    searchBarContainer: {
        backgroundColor: COLORS.white,

    },

    // Badge Styles
    badge: {
        backgroundColor: COLORS.primary,
        borderRadius: 10,
        height: 20,
        width: 20,
        justifyContent: "center",
        alignItems: "center",
    },
    badgeText: {
        color: COLORS.white,
        fontSize: FONTS.small,
    },
    badgeIcon: {
        color: COLORS.white,
        fontSize: FONTS.small,
    },
    badgeTextContainer: {
        position: "absolute",
        top: -5,
        right: -5,
        backgroundColor: COLORS.primary,
        borderRadius: 10,
        height: 20,
        width: 20,
        justifyContent: "center",
        alignItems: "center",
    }

}

const appTheme = { COLORS, SIZES, FONTS, STYLES };

export default appTheme;