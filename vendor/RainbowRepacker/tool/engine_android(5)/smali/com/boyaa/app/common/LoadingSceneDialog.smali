.class public Lcom/boyaa/app/common/LoadingSceneDialog;
.super Landroid/app/AlertDialog;
.source "LoadingSceneDialog.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 20
    const v0, 0x7f080005

    invoke-direct {p0, p1, v0}, Landroid/app/AlertDialog;-><init>(Landroid/content/Context;I)V

    .line 21
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "jsonMsg"    # Ljava/lang/String;

    .prologue
    .line 24
    const v0, 0x7f080005

    invoke-direct {p0, p1, v0}, Landroid/app/AlertDialog;-><init>(Landroid/content/Context;I)V

    .line 35
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 39
    invoke-super {p0, p1}, Landroid/app/AlertDialog;->onCreate(Landroid/os/Bundle;)V

    .line 40
    const v0, 0x7f030004

    invoke-virtual {p0, v0}, Lcom/boyaa/app/common/LoadingSceneDialog;->setContentView(I)V

    .line 48
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 96
    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    if-nez v0, :cond_0

    .line 97
    const/4 v0, 0x1

    .line 99
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1, p2}, Landroid/app/AlertDialog;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method public onStart()V
    .locals 0

    .prologue
    .line 70
    invoke-super {p0}, Landroid/app/AlertDialog;->onStart()V

    .line 71
    return-void
.end method

.method protected onStop()V
    .locals 0

    .prologue
    .line 89
    invoke-super {p0}, Landroid/app/AlertDialog;->onStop()V

    .line 93
    return-void
.end method

.method public show()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, -0x1

    .line 76
    invoke-virtual {p0}, Lcom/boyaa/app/common/LoadingSceneDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    .line 77
    .local v1, "win":Landroid/view/Window;
    invoke-virtual {v1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    .line 78
    .local v0, "layoutParams":Landroid/view/WindowManager$LayoutParams;
    iput v2, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 79
    iput v2, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 80
    const/16 v2, 0x400

    iput v2, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 81
    invoke-virtual {v1, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 82
    invoke-virtual {p0, v3}, Lcom/boyaa/app/common/LoadingSceneDialog;->setCancelable(Z)V

    .line 83
    invoke-virtual {p0, v3}, Lcom/boyaa/app/common/LoadingSceneDialog;->setCanceledOnTouchOutside(Z)V

    .line 84
    invoke-super {p0}, Landroid/app/AlertDialog;->show()V

    .line 85
    return-void
.end method
