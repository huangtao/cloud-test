.class public Lcom/boyaa/app/web/WebInputDialog;
.super Landroid/app/Dialog;
.source "WebInputDialog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/boyaa/app/web/WebInputDialog$WebInputDialogCallBack;
    }
.end annotation


# instance fields
.field private mBtn:Landroid/widget/Button;

.field private mEt:Landroid/widget/EditText;

.field private wdcb:Lcom/boyaa/app/web/WebInputDialog$WebInputDialogCallBack;


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "theme"    # I

    .prologue
    .line 25
    invoke-direct {p0, p1, p2}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 27
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/boyaa/app/web/WebInputDialog$WebInputDialogCallBack;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "wdcb"    # Lcom/boyaa/app/web/WebInputDialog$WebInputDialogCallBack;

    .prologue
    .line 30
    const v0, 0x7f080004

    invoke-direct {p0, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 32
    iput-object p2, p0, Lcom/boyaa/app/web/WebInputDialog;->wdcb:Lcom/boyaa/app/web/WebInputDialog$WebInputDialogCallBack;

    .line 33
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;ZLandroid/content/DialogInterface$OnCancelListener;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "cancelable"    # Z
    .param p3, "cancelListener"    # Landroid/content/DialogInterface$OnCancelListener;

    .prologue
    .line 20
    invoke-direct {p0, p1, p2, p3}, Landroid/app/Dialog;-><init>(Landroid/content/Context;ZLandroid/content/DialogInterface$OnCancelListener;)V

    .line 22
    return-void
.end method

.method static synthetic access$0(Lcom/boyaa/app/web/WebInputDialog;)Lcom/boyaa/app/web/WebInputDialog$WebInputDialogCallBack;
    .locals 1

    .prologue
    .line 37
    iget-object v0, p0, Lcom/boyaa/app/web/WebInputDialog;->wdcb:Lcom/boyaa/app/web/WebInputDialog$WebInputDialogCallBack;

    return-object v0
.end method

.method static synthetic access$1(Lcom/boyaa/app/web/WebInputDialog;)Landroid/widget/EditText;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/boyaa/app/web/WebInputDialog;->mEt:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$2(Lcom/boyaa/app/web/WebInputDialog;)V
    .locals 0

    .prologue
    .line 75
    invoke-direct {p0}, Lcom/boyaa/app/web/WebInputDialog;->openKeyboard()V

    return-void
.end method

.method private hideImme(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 111
    invoke-virtual {p0}, Lcom/boyaa/app/web/WebInputDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "input_method"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 112
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    invoke-virtual {p0}, Lcom/boyaa/app/web/WebInputDialog;->getCurrentFocus()Landroid/view/View;

    move-result-object v1

    .line 113
    .local v1, "v1":Landroid/view/View;
    if-nez v1, :cond_0

    .line 114
    move-object v1, p1

    .line 115
    :cond_0
    if-eqz v1, :cond_1

    .line 116
    invoke-virtual {v1}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 117
    :cond_1
    return-void
.end method

.method private openKeyboard()V
    .locals 3

    .prologue
    .line 76
    invoke-virtual {p0}, Lcom/boyaa/app/web/WebInputDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 77
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    iget-object v1, p0, Lcom/boyaa/app/web/WebInputDialog;->mEt:Landroid/widget/EditText;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    .line 78
    return-void
.end method

.method private showImme(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v3, 0x2

    .line 105
    invoke-virtual {p0}, Lcom/boyaa/app/web/WebInputDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 107
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    invoke-virtual {p1}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    invoke-virtual {v0, v1, v3, v3}, Landroid/view/inputmethod/InputMethodManager;->toggleSoftInputFromWindow(Landroid/os/IBinder;II)V

    .line 108
    return-void
.end method


# virtual methods
.method public dismiss()V
    .locals 1

    .prologue
    .line 99
    iget-object v0, p0, Lcom/boyaa/app/web/WebInputDialog;->mEt:Landroid/widget/EditText;

    invoke-direct {p0, v0}, Lcom/boyaa/app/web/WebInputDialog;->hideImme(Landroid/view/View;)V

    .line 100
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    .line 101
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v3, -0x1

    .line 41
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 42
    const v2, 0x7f03000a

    invoke-virtual {p0, v2}, Lcom/boyaa/app/web/WebInputDialog;->setContentView(I)V

    .line 43
    const v2, 0x7f06002a

    invoke-virtual {p0, v2}, Lcom/boyaa/app/web/WebInputDialog;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    iput-object v2, p0, Lcom/boyaa/app/web/WebInputDialog;->mBtn:Landroid/widget/Button;

    .line 44
    const v2, 0x7f060029

    invoke-virtual {p0, v2}, Lcom/boyaa/app/web/WebInputDialog;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    iput-object v2, p0, Lcom/boyaa/app/web/WebInputDialog;->mEt:Landroid/widget/EditText;

    .line 45
    invoke-virtual {p0}, Lcom/boyaa/app/web/WebInputDialog;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    .line 46
    .local v1, "lp":Landroid/view/WindowManager$LayoutParams;
    iput v3, v1, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 47
    iput v3, v1, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 48
    invoke-virtual {p0}, Lcom/boyaa/app/web/WebInputDialog;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 49
    iget-object v2, p0, Lcom/boyaa/app/web/WebInputDialog;->mBtn:Landroid/widget/Button;

    new-instance v3, Lcom/boyaa/app/web/WebInputDialog$1;

    invoke-direct {v3, p0}, Lcom/boyaa/app/web/WebInputDialog$1;-><init>(Lcom/boyaa/app/web/WebInputDialog;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 61
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    .line 62
    .local v0, "initHandler":Landroid/os/Handler;
    new-instance v2, Lcom/boyaa/app/web/WebInputDialog$2;

    invoke-direct {v2, p0}, Lcom/boyaa/app/web/WebInputDialog$2;-><init>(Lcom/boyaa/app/web/WebInputDialog;)V

    .line 69
    const-wide/16 v3, 0xc8

    .line 62
    invoke-virtual {v0, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 70
    return-void
.end method

.method protected onStart()V
    .locals 0

    .prologue
    .line 93
    invoke-super {p0}, Landroid/app/Dialog;->onStart()V

    .line 94
    return-void
.end method

.method public showDialog(Ljava/lang/String;)V
    .locals 2
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 83
    invoke-super {p0}, Landroid/app/Dialog;->show()V

    .line 84
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 85
    iget-object v0, p0, Lcom/boyaa/app/web/WebInputDialog;->mEt:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 86
    iget-object v0, p0, Lcom/boyaa/app/web/WebInputDialog;->mEt:Landroid/widget/EditText;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSelection(I)V

    .line 88
    :cond_0
    return-void
.end method
