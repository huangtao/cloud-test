.class public Lcom/boyaa/engine/made/AppEditBoxView;
.super Ljava/lang/Object;
.source "AppEditBoxView.java"


# static fields
.field public static mInstance:Lcom/boyaa/engine/made/AppEditBoxView;


# instance fields
.field private isCallAction:Z

.field private keyboardHeight:I

.field private mActivity:Lcom/boyaa/engine/made/AppActivity;

.field private mContent:Ljava/lang/String;

.field private mFontColor:I

.field private mFontName:Ljava/lang/String;

.field private mFontSize:I

.field private mInputEditText:Landroid/widget/EditText;

.field private mInputFlag:I

.field private mInputFlagConstraints:I

.field private mInputMode:I

.field private mInputModeContraints:I

.field private mIsSoftKeyboardShowing:Z

.field private mMaxLength:I

.field private mRectH:I

.field private mRectW:I

.field private mRectX:I

.field private mRectY:I

.field private mReturnType:I

.field private mText:Ljava/lang/String;

.field private mTitle:Ljava/lang/String;

.field private oldImeOptions:I

.field private outerLayout:Landroid/widget/RelativeLayout;

.field private textWatcher:Landroid/text/TextWatcher;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 112
    const/4 v0, 0x0

    sput-object v0, Lcom/boyaa/engine/made/AppEditBoxView;->mInstance:Lcom/boyaa/engine/made/AppEditBoxView;

    return-void
.end method

.method private constructor <init>(Lcom/boyaa/engine/made/AppActivity;Ljava/lang/String;ILjava/lang/String;IIIIIIII)V
    .locals 2
    .param p1, "activity"    # Lcom/boyaa/engine/made/AppActivity;
    .param p2, "text"    # Ljava/lang/String;
    .param p3, "maxLen"    # I
    .param p4, "fontname"    # Ljava/lang/String;
    .param p5, "fontSize"    # I
    .param p6, "r"    # I
    .param p7, "g"    # I
    .param p8, "b"    # I
    .param p9, "x"    # I
    .param p10, "y"    # I
    .param p11, "w"    # I
    .param p12, "h"    # I

    .prologue
    const/4 v1, 0x0

    .line 203
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    iput v1, p0, Lcom/boyaa/engine/made/AppEditBoxView;->keyboardHeight:I

    .line 64
    new-instance v0, Lcom/boyaa/engine/made/AppEditBoxView$1;

    invoke-direct {v0, p0}, Lcom/boyaa/engine/made/AppEditBoxView$1;-><init>(Lcom/boyaa/engine/made/AppEditBoxView;)V

    iput-object v0, p0, Lcom/boyaa/engine/made/AppEditBoxView;->textWatcher:Landroid/text/TextWatcher;

    .line 109
    iput-boolean v1, p0, Lcom/boyaa/engine/made/AppEditBoxView;->isCallAction:Z

    .line 111
    iput-boolean v1, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mIsSoftKeyboardShowing:Z

    .line 206
    iput-object p1, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mActivity:Lcom/boyaa/engine/made/AppActivity;

    .line 207
    const-string v0, ""

    iput-object v0, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mTitle:Ljava/lang/String;

    .line 208
    iput-object p2, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mContent:Ljava/lang/String;

    .line 209
    iput p3, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mMaxLength:I

    .line 210
    iput p9, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mRectX:I

    .line 211
    iput p10, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mRectY:I

    .line 212
    iput p11, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mRectW:I

    .line 213
    iput p12, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mRectH:I

    .line 214
    iput-object p4, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mFontName:Ljava/lang/String;

    .line 215
    iput p5, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mFontSize:I

    .line 216
    invoke-static {p6, p7, p8}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    iput v0, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mFontColor:I

    .line 217
    return-void
.end method

.method synthetic constructor <init>(Lcom/boyaa/engine/made/AppActivity;Ljava/lang/String;ILjava/lang/String;IIIIIIIILcom/boyaa/engine/made/AppEditBoxView$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/boyaa/engine/made/AppActivity;
    .param p2, "x1"    # Ljava/lang/String;
    .param p3, "x2"    # I
    .param p4, "x3"    # Ljava/lang/String;
    .param p5, "x4"    # I
    .param p6, "x5"    # I
    .param p7, "x6"    # I
    .param p8, "x7"    # I
    .param p9, "x8"    # I
    .param p10, "x9"    # I
    .param p11, "x10"    # I
    .param p12, "x11"    # I
    .param p13, "x12"    # Lcom/boyaa/engine/made/AppEditBoxView$1;

    .prologue
    .line 36
    invoke-direct/range {p0 .. p12}, Lcom/boyaa/engine/made/AppEditBoxView;-><init>(Lcom/boyaa/engine/made/AppActivity;Ljava/lang/String;ILjava/lang/String;IIIIIIII)V

    return-void
.end method

.method static synthetic access$000(Lcom/boyaa/engine/made/AppEditBoxView;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/boyaa/engine/made/AppEditBoxView;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mText:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$002(Lcom/boyaa/engine/made/AppEditBoxView;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/boyaa/engine/made/AppEditBoxView;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 36
    iput-object p1, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mText:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$100(Lcom/boyaa/engine/made/AppEditBoxView;)Lcom/boyaa/engine/made/AppActivity;
    .locals 1
    .param p0, "x0"    # Lcom/boyaa/engine/made/AppEditBoxView;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mActivity:Lcom/boyaa/engine/made/AppActivity;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/boyaa/engine/made/AppEditBoxView;)I
    .locals 1
    .param p0, "x0"    # Lcom/boyaa/engine/made/AppEditBoxView;

    .prologue
    .line 36
    iget v0, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputModeContraints:I

    return v0
.end method

.method static synthetic access$1100(Lcom/boyaa/engine/made/AppEditBoxView;)I
    .locals 1
    .param p0, "x0"    # Lcom/boyaa/engine/made/AppEditBoxView;

    .prologue
    .line 36
    iget v0, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputFlagConstraints:I

    return v0
.end method

.method static synthetic access$200(Lcom/boyaa/engine/made/AppEditBoxView;)V
    .locals 0
    .param p0, "x0"    # Lcom/boyaa/engine/made/AppEditBoxView;

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/boyaa/engine/made/AppEditBoxView;->update()V

    return-void
.end method

.method static synthetic access$300(Lcom/boyaa/engine/made/AppEditBoxView;)V
    .locals 0
    .param p0, "x0"    # Lcom/boyaa/engine/made/AppEditBoxView;

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/boyaa/engine/made/AppEditBoxView;->setFocus()V

    return-void
.end method

.method static synthetic access$500(Lcom/boyaa/engine/made/AppEditBoxView;)V
    .locals 0
    .param p0, "x0"    # Lcom/boyaa/engine/made/AppEditBoxView;

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/boyaa/engine/made/AppEditBoxView;->show()V

    return-void
.end method

.method static synthetic access$600(Lcom/boyaa/engine/made/AppEditBoxView;)V
    .locals 0
    .param p0, "x0"    # Lcom/boyaa/engine/made/AppEditBoxView;

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/boyaa/engine/made/AppEditBoxView;->inputCancel()V

    return-void
.end method

.method static synthetic access$700(Lcom/boyaa/engine/made/AppEditBoxView;)Z
    .locals 1
    .param p0, "x0"    # Lcom/boyaa/engine/made/AppEditBoxView;

    .prologue
    .line 36
    iget-boolean v0, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mIsSoftKeyboardShowing:Z

    return v0
.end method

.method static synthetic access$702(Lcom/boyaa/engine/made/AppEditBoxView;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/boyaa/engine/made/AppEditBoxView;
    .param p1, "x1"    # Z

    .prologue
    .line 36
    iput-boolean p1, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mIsSoftKeyboardShowing:Z

    return p1
.end method

.method static synthetic access$800(Lcom/boyaa/engine/made/AppEditBoxView;)I
    .locals 1
    .param p0, "x0"    # Lcom/boyaa/engine/made/AppEditBoxView;

    .prologue
    .line 36
    iget v0, p0, Lcom/boyaa/engine/made/AppEditBoxView;->keyboardHeight:I

    return v0
.end method

.method static synthetic access$802(Lcom/boyaa/engine/made/AppEditBoxView;I)I
    .locals 0
    .param p0, "x0"    # Lcom/boyaa/engine/made/AppEditBoxView;
    .param p1, "x1"    # I

    .prologue
    .line 36
    iput p1, p0, Lcom/boyaa/engine/made/AppEditBoxView;->keyboardHeight:I

    return p1
.end method

.method static synthetic access$900(Lcom/boyaa/engine/made/AppEditBoxView;)V
    .locals 0
    .param p0, "x0"    # Lcom/boyaa/engine/made/AppEditBoxView;

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/boyaa/engine/made/AppEditBoxView;->inputDone()V

    return-void
.end method

.method private close()V
    .locals 2

    .prologue
    .line 548
    invoke-direct {p0}, Lcom/boyaa/engine/made/AppEditBoxView;->closeKeyboard()V

    .line 549
    iget-object v0, p0, Lcom/boyaa/engine/made/AppEditBoxView;->outerLayout:Landroid/widget/RelativeLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 550
    return-void
.end method

.method public static closeIMEEdit()V
    .locals 2

    .prologue
    .line 120
    invoke-static {}, Lcom/boyaa/engine/made/AppActivity;->getInstance()Lcom/boyaa/engine/made/AppActivity;

    move-result-object v0

    new-instance v1, Lcom/boyaa/engine/made/AppEditBoxView$2;

    invoke-direct {v1}, Lcom/boyaa/engine/made/AppEditBoxView$2;-><init>()V

    invoke-virtual {v0, v1}, Lcom/boyaa/engine/made/AppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 129
    return-void
.end method

.method private closeKeyboard()V
    .locals 3

    .prologue
    .line 542
    iget-object v1, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mActivity:Lcom/boyaa/engine/made/AppActivity;

    const-string v2, "input_method"

    invoke-virtual {v1, v2}, Lcom/boyaa/engine/made/AppActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 544
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    iget-object v1, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputEditText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 545
    return-void
.end method

.method private initUI()V
    .locals 8

    .prologue
    const/4 v3, -0x1

    const/4 v6, 0x1

    const/16 v5, -0xc8

    const/4 v7, 0x0

    .line 237
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v3, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 241
    .local v0, "lp":Landroid/widget/RelativeLayout$LayoutParams;
    new-instance v3, Landroid/widget/RelativeLayout;

    iget-object v4, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mActivity:Lcom/boyaa/engine/made/AppActivity;

    invoke-direct {v3, v4}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/boyaa/engine/made/AppEditBoxView;->outerLayout:Landroid/widget/RelativeLayout;

    .line 242
    new-instance v3, Landroid/widget/EditText;

    iget-object v4, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mActivity:Lcom/boyaa/engine/made/AppActivity;

    invoke-direct {v3, v4}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputEditText:Landroid/widget/EditText;

    .line 243
    iget-object v3, p0, Lcom/boyaa/engine/made/AppEditBoxView;->outerLayout:Landroid/widget/RelativeLayout;

    iget-object v4, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputEditText:Landroid/widget/EditText;

    invoke-virtual {v3, v4}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 244
    iget-object v3, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mActivity:Lcom/boyaa/engine/made/AppActivity;

    iget-object v4, p0, Lcom/boyaa/engine/made/AppEditBoxView;->outerLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v3, v4, v0}, Lcom/boyaa/engine/made/AppActivity;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 247
    iget-object v3, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputEditText:Landroid/widget/EditText;

    invoke-virtual {v3, v7}, Landroid/widget/EditText;->setBackgroundColor(I)V

    .line 248
    iget-object v3, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputEditText:Landroid/widget/EditText;

    invoke-virtual {v3, v6}, Landroid/widget/EditText;->setCursorVisible(Z)V

    .line 252
    iget-object v3, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mFontName:Ljava/lang/String;

    invoke-static {v3, v7}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v2

    .line 253
    .local v2, "typeFace":Landroid/graphics/Typeface;
    iget-object v3, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputEditText:Landroid/widget/EditText;

    invoke-virtual {v3, v2}, Landroid/widget/EditText;->setTypeface(Landroid/graphics/Typeface;)V

    .line 254
    iget-object v3, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputEditText:Landroid/widget/EditText;

    iget v4, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mFontSize:I

    int-to-float v4, v4

    invoke-virtual {v3, v7, v4}, Landroid/widget/EditText;->setTextSize(IF)V

    .line 255
    iget-object v3, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputEditText:Landroid/widget/EditText;

    iget v4, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mFontColor:I

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setTextColor(I)V

    .line 256
    iget-object v3, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputEditText:Landroid/widget/EditText;

    const v4, 0x10000001

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setImeOptions(I)V

    .line 257
    iget-object v3, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputEditText:Landroid/widget/EditText;

    invoke-virtual {v3, v7, v7, v7, v7}, Landroid/widget/EditText;->setPadding(IIII)V

    .line 258
    iget-object v3, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputEditText:Landroid/widget/EditText;

    const/4 v4, 0x3

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setGravity(I)V

    .line 259
    iget-object v3, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputEditText:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getImeOptions()I

    move-result v3

    iput v3, p0, Lcom/boyaa/engine/made/AppEditBoxView;->oldImeOptions:I

    .line 262
    iget-object v3, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputEditText:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 263
    .local v1, "mp":Landroid/view/ViewGroup$MarginLayoutParams;
    iget v3, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mRectX:I

    iput v3, v1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 264
    iget v3, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mRectY:I

    iput v3, v1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 265
    iget v3, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mRectW:I

    iput v3, v1, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 266
    iget v3, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mRectH:I

    iput v3, v1, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 269
    iget v3, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mRectX:I

    if-gt v3, v5, :cond_0

    iget v3, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mRectY:I

    if-le v3, v5, :cond_1

    .line 270
    :cond_0
    iget-object v3, p0, Lcom/boyaa/engine/made/AppEditBoxView;->outerLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v3, v6}, Landroid/widget/RelativeLayout;->setClickable(Z)V

    .line 271
    iget-object v3, p0, Lcom/boyaa/engine/made/AppEditBoxView;->outerLayout:Landroid/widget/RelativeLayout;

    new-instance v4, Lcom/boyaa/engine/made/AppEditBoxView$5;

    invoke-direct {v4, p0}, Lcom/boyaa/engine/made/AppEditBoxView$5;-><init>(Lcom/boyaa/engine/made/AppEditBoxView;)V

    invoke-virtual {v3, v4}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 280
    :cond_1
    iget-object v3, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputEditText:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v3

    new-instance v4, Lcom/boyaa/engine/made/AppEditBoxView$6;

    invoke-direct {v4, p0}, Lcom/boyaa/engine/made/AppEditBoxView$6;-><init>(Lcom/boyaa/engine/made/AppEditBoxView;)V

    invoke-virtual {v3, v4}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 334
    invoke-direct {p0}, Lcom/boyaa/engine/made/AppEditBoxView;->update()V

    .line 353
    iget v3, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mRectX:I

    if-gt v3, v5, :cond_2

    iget v3, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mRectY:I

    if-le v3, v5, :cond_3

    .line 354
    :cond_2
    iget-object v3, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputEditText:Landroid/widget/EditText;

    new-instance v4, Lcom/boyaa/engine/made/AppEditBoxView$7;

    invoke-direct {v4, p0}, Lcom/boyaa/engine/made/AppEditBoxView$7;-><init>(Lcom/boyaa/engine/made/AppEditBoxView;)V

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 374
    :cond_3
    invoke-direct {p0}, Lcom/boyaa/engine/made/AppEditBoxView;->setFocus()V

    .line 377
    iget-object v3, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputEditText:Landroid/widget/EditText;

    new-instance v4, Lcom/boyaa/engine/made/AppEditBoxView$8;

    invoke-direct {v4, p0}, Lcom/boyaa/engine/made/AppEditBoxView$8;-><init>(Lcom/boyaa/engine/made/AppEditBoxView;)V

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 392
    iget v3, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mMaxLength:I

    if-lez v3, :cond_4

    .line 393
    iget-object v3, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputEditText:Landroid/widget/EditText;

    new-array v4, v6, [Landroid/text/InputFilter;

    new-instance v5, Landroid/text/InputFilter$LengthFilter;

    iget v6, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mMaxLength:I

    invoke-direct {v5, v6}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    aput-object v5, v4, v7

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setFilters([Landroid/text/InputFilter;)V

    .line 396
    :cond_4
    return-void
.end method

.method private inputCancel()V
    .locals 3

    .prologue
    .line 517
    iget-boolean v1, p0, Lcom/boyaa/engine/made/AppEditBoxView;->isCallAction:Z

    if-nez v1, :cond_0

    .line 518
    iget-object v1, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputEditText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 519
    .local v0, "returnStr":Ljava/lang/String;
    invoke-direct {p0}, Lcom/boyaa/engine/made/AppEditBoxView;->close()V

    .line 522
    iget-object v1, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mActivity:Lcom/boyaa/engine/made/AppActivity;

    new-instance v2, Lcom/boyaa/engine/made/AppEditBoxView$10;

    invoke-direct {v2, p0, v0}, Lcom/boyaa/engine/made/AppEditBoxView$10;-><init>(Lcom/boyaa/engine/made/AppEditBoxView;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Lcom/boyaa/engine/made/AppActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    .line 530
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/boyaa/engine/made/AppEditBoxView;->isCallAction:Z

    .line 533
    .end local v0    # "returnStr":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method private inputDone()V
    .locals 3

    .prologue
    .line 499
    iget-boolean v1, p0, Lcom/boyaa/engine/made/AppEditBoxView;->isCallAction:Z

    if-nez v1, :cond_0

    .line 500
    iget-object v1, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputEditText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 501
    .local v0, "returnStr":Ljava/lang/String;
    invoke-direct {p0}, Lcom/boyaa/engine/made/AppEditBoxView;->close()V

    .line 504
    iget-object v1, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mActivity:Lcom/boyaa/engine/made/AppActivity;

    new-instance v2, Lcom/boyaa/engine/made/AppEditBoxView$9;

    invoke-direct {v2, p0, v0}, Lcom/boyaa/engine/made/AppEditBoxView$9;-><init>(Lcom/boyaa/engine/made/AppEditBoxView;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Lcom/boyaa/engine/made/AppActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    .line 512
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/boyaa/engine/made/AppEditBoxView;->isCallAction:Z

    .line 514
    .end local v0    # "returnStr":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method public static native onDeleteBackward(I)V
.end method

.method public static native onImeClosed([BI)V
.end method

.method public static native onImeOpened(FFFF)V
.end method

.method public static native onInsertText(Ljava/lang/String;)V
.end method

.method public static open([BI[BIIIIIIII)V
    .locals 13
    .param p0, "text"    # [B
    .param p1, "maxLen"    # I
    .param p2, "fontname"    # [B
    .param p3, "fontSize"    # I
    .param p4, "r"    # I
    .param p5, "g"    # I
    .param p6, "b"    # I
    .param p7, "x"    # I
    .param p8, "y"    # I
    .param p9, "w"    # I
    .param p10, "h"    # I

    .prologue
    .line 147
    invoke-static {}, Lcom/boyaa/engine/made/AppActivity;->getInstance()Lcom/boyaa/engine/made/AppActivity;

    move-result-object v12

    new-instance v0, Lcom/boyaa/engine/made/AppEditBoxView$4;

    move-object v1, p0

    move-object v2, p2

    move v3, p1

    move/from16 v4, p3

    move/from16 v5, p4

    move/from16 v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    move/from16 v9, p8

    move/from16 v10, p9

    move/from16 v11, p10

    invoke-direct/range {v0 .. v11}, Lcom/boyaa/engine/made/AppEditBoxView$4;-><init>([B[BIIIIIIIII)V

    invoke-virtual {v12, v0}, Lcom/boyaa/engine/made/AppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 166
    return-void
.end method

.method public static openIMEEdit([BI[BIIIIIIII)V
    .locals 0
    .param p0, "text"    # [B
    .param p1, "maxLen"    # I
    .param p2, "fontname"    # [B
    .param p3, "fontSize"    # I
    .param p4, "r"    # I
    .param p5, "g"    # I
    .param p6, "b"    # I
    .param p7, "x"    # I
    .param p8, "y"    # I
    .param p9, "w"    # I
    .param p10, "h"    # I

    .prologue
    .line 117
    invoke-static/range {p0 .. p10}, Lcom/boyaa/engine/made/AppEditBoxView;->open([BI[BIIIIIIII)V

    .line 118
    return-void
.end method

.method private openKeyboard()V
    .locals 3

    .prologue
    .line 536
    iget-object v1, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mActivity:Lcom/boyaa/engine/made/AppActivity;

    const-string v2, "input_method"

    invoke-virtual {v1, v2}, Lcom/boyaa/engine/made/AppActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 538
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    iget-object v1, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputEditText:Landroid/widget/EditText;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    .line 539
    return-void
.end method

.method private setExtraKeyListener()V
    .locals 2

    .prologue
    .line 557
    iget v0, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputFlag:I

    const/4 v1, 0x5

    if-eq v0, v1, :cond_0

    iget v0, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputFlag:I

    if-nez v0, :cond_1

    .line 559
    :cond_0
    iget-object v0, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputEditText:Landroid/widget/EditText;

    new-instance v1, Lcom/boyaa/engine/made/AppEditBoxView$11;

    invoke-direct {v1, p0}, Lcom/boyaa/engine/made/AppEditBoxView$11;-><init>(Lcom/boyaa/engine/made/AppEditBoxView;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setKeyListener(Landroid/text/method/KeyListener;)V

    .line 577
    :cond_1
    return-void
.end method

.method private setFocus()V
    .locals 2

    .prologue
    .line 228
    iget-object v0, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputEditText:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocus()Z

    .line 229
    iget-object v0, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputEditText:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/boyaa/engine/made/AppEditBoxView;->textWatcher:Landroid/text/TextWatcher;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    .line 230
    iget-object v0, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputEditText:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mContent:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 231
    iget-object v0, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputEditText:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputEditText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->length()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSelection(I)V

    .line 233
    iget-object v0, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputEditText:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/boyaa/engine/made/AppEditBoxView;->textWatcher:Landroid/text/TextWatcher;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 234
    return-void
.end method

.method private show()V
    .locals 0

    .prologue
    .line 221
    invoke-direct {p0}, Lcom/boyaa/engine/made/AppEditBoxView;->initUI()V

    .line 224
    invoke-direct {p0}, Lcom/boyaa/engine/made/AppEditBoxView;->openKeyboard()V

    .line 225
    return-void
.end method

.method private update()V
    .locals 7

    .prologue
    const v6, 0x20001

    const/16 v5, 0x81

    const/4 v4, 0x3

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 400
    const-string v0, "inputEditExTable"

    const-string v1, "inputMode"

    invoke-static {v0, v1, v2}, Lcom/boyaa/engine/made/Dict;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputMode:I

    .line 401
    const-string v0, "inputEditExTable"

    const-string v1, "inputFlag"

    invoke-static {v0, v1, v3}, Lcom/boyaa/engine/made/Dict;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputFlag:I

    .line 402
    const-string v0, "inputEditExTable"

    const-string v1, "returnType"

    invoke-static {v0, v1, v2}, Lcom/boyaa/engine/made/Dict;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mReturnType:I

    .line 404
    iget v0, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputMode:I

    packed-switch v0, :pswitch_data_0

    .line 441
    :goto_0
    iget v0, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputFlag:I

    packed-switch v0, :pswitch_data_1

    .line 466
    :goto_1
    iget-object v0, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputEditText:Landroid/widget/EditText;

    iget v1, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputModeContraints:I

    iget v2, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputFlagConstraints:I

    or-int/2addr v1, v2

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setInputType(I)V

    .line 469
    iget v0, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mReturnType:I

    packed-switch v0, :pswitch_data_2

    .line 491
    iget-object v0, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputEditText:Landroid/widget/EditText;

    iget v1, p0, Lcom/boyaa/engine/made/AppEditBoxView;->oldImeOptions:I

    or-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setImeOptions(I)V

    .line 496
    :goto_2
    return-void

    .line 406
    :pswitch_0
    iput v6, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputModeContraints:I

    goto :goto_0

    .line 410
    :pswitch_1
    const/16 v0, 0x21

    iput v0, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputModeContraints:I

    goto :goto_0

    .line 414
    :pswitch_2
    const/16 v0, 0x1002

    iput v0, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputModeContraints:I

    goto :goto_0

    .line 418
    :pswitch_3
    iput v4, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputModeContraints:I

    goto :goto_0

    .line 421
    :pswitch_4
    const/16 v0, 0x11

    iput v0, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputModeContraints:I

    goto :goto_0

    .line 425
    :pswitch_5
    const/16 v0, 0x3002

    iput v0, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputModeContraints:I

    goto :goto_0

    .line 430
    :pswitch_6
    iput v3, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputModeContraints:I

    goto :goto_0

    .line 433
    :pswitch_7
    iput v6, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputModeContraints:I

    .line 435
    iget-object v0, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputEditText:Landroid/widget/EditText;

    invoke-virtual {v0, v4}, Landroid/widget/EditText;->setGravity(I)V

    goto :goto_0

    .line 443
    :pswitch_8
    iput v5, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputFlagConstraints:I

    goto :goto_1

    .line 447
    :pswitch_9
    const/high16 v0, 0x80000

    iput v0, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputFlagConstraints:I

    goto :goto_1

    .line 450
    :pswitch_a
    const/16 v0, 0x2000

    iput v0, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputFlagConstraints:I

    goto :goto_1

    .line 453
    :pswitch_b
    const/16 v0, 0x4000

    iput v0, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputFlagConstraints:I

    goto :goto_1

    .line 456
    :pswitch_c
    const/16 v0, 0x1000

    iput v0, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputFlagConstraints:I

    goto :goto_1

    .line 459
    :pswitch_d
    iput v5, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputFlagConstraints:I

    goto :goto_1

    .line 471
    :pswitch_e
    iget-object v0, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputEditText:Landroid/widget/EditText;

    iget v1, p0, Lcom/boyaa/engine/made/AppEditBoxView;->oldImeOptions:I

    or-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setImeOptions(I)V

    goto :goto_2

    .line 475
    :pswitch_f
    iget-object v0, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputEditText:Landroid/widget/EditText;

    iget v1, p0, Lcom/boyaa/engine/made/AppEditBoxView;->oldImeOptions:I

    or-int/lit8 v1, v1, 0x6

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setImeOptions(I)V

    goto :goto_2

    .line 479
    :pswitch_10
    iget-object v0, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputEditText:Landroid/widget/EditText;

    iget v1, p0, Lcom/boyaa/engine/made/AppEditBoxView;->oldImeOptions:I

    or-int/lit8 v1, v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setImeOptions(I)V

    goto :goto_2

    .line 483
    :pswitch_11
    iget-object v0, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputEditText:Landroid/widget/EditText;

    iget v1, p0, Lcom/boyaa/engine/made/AppEditBoxView;->oldImeOptions:I

    or-int/lit8 v1, v1, 0x3

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setImeOptions(I)V

    goto :goto_2

    .line 487
    :pswitch_12
    iget-object v0, p0, Lcom/boyaa/engine/made/AppEditBoxView;->mInputEditText:Landroid/widget/EditText;

    iget v1, p0, Lcom/boyaa/engine/made/AppEditBoxView;->oldImeOptions:I

    or-int/lit8 v1, v1, 0x2

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setImeOptions(I)V

    goto :goto_2

    .line 404
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
    .end packed-switch

    .line 441
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
    .end packed-switch

    .line 469
    :pswitch_data_2
    .packed-switch 0x0
        :pswitch_e
        :pswitch_f
        :pswitch_10
        :pswitch_11
        :pswitch_12
    .end packed-switch
.end method

.method public static updateIMEEdit()V
    .locals 2

    .prologue
    .line 132
    invoke-static {}, Lcom/boyaa/engine/made/AppActivity;->getInstance()Lcom/boyaa/engine/made/AppActivity;

    move-result-object v0

    new-instance v1, Lcom/boyaa/engine/made/AppEditBoxView$3;

    invoke-direct {v1}, Lcom/boyaa/engine/made/AppEditBoxView$3;-><init>()V

    invoke-virtual {v0, v1}, Lcom/boyaa/engine/made/AppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 141
    return-void
.end method


# virtual methods
.method public delete()V
    .locals 2

    .prologue
    .line 552
    invoke-direct {p0}, Lcom/boyaa/engine/made/AppEditBoxView;->close()V

    .line 553
    iget-object v0, p0, Lcom/boyaa/engine/made/AppEditBoxView;->outerLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/boyaa/engine/made/AppEditBoxView;->outerLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 554
    return-void
.end method
