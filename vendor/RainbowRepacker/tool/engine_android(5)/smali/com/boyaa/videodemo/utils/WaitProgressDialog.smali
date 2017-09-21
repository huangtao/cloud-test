.class public Lcom/boyaa/videodemo/utils/WaitProgressDialog;
.super Landroid/app/Dialog;
.source "WaitProgressDialog.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "WaitProgressDialog"


# instance fields
.field private context:Landroid/app/Activity;

.field private window:Landroid/view/Window;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .locals 1
    .param p1, "context"    # Landroid/app/Activity;

    .prologue
    .line 20
    invoke-direct {p0, p1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    .line 41
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/videodemo/utils/WaitProgressDialog;->window:Landroid/view/Window;

    .line 21
    iput-object p1, p0, Lcom/boyaa/videodemo/utils/WaitProgressDialog;->context:Landroid/app/Activity;

    .line 22
    return-void
.end method


# virtual methods
.method public dismiss()V
    .locals 1

    .prologue
    .line 64
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    .line 65
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/videodemo/utils/WaitProgressDialog;->context:Landroid/app/Activity;

    .line 66
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v2, -0x2

    .line 26
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 28
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/boyaa/videodemo/utils/WaitProgressDialog;->requestWindowFeature(I)Z

    .line 30
    new-instance v0, Landroid/widget/ProgressBar;

    iget-object v1, p0, Lcom/boyaa/videodemo/utils/WaitProgressDialog;->context:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;)V

    .line 31
    .local v0, "progressBar":Landroid/widget/ProgressBar;
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 32
    invoke-direct {v1, v2, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 31
    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 37
    invoke-virtual {p0, v0}, Lcom/boyaa/videodemo/utils/WaitProgressDialog;->setContentView(Landroid/view/View;)V

    .line 38
    invoke-virtual {p0}, Lcom/boyaa/videodemo/utils/WaitProgressDialog;->windowDeploy()V

    .line 39
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 70
    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    .line 71
    const/4 v0, 0x1

    .line 73
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public windowDeploy()V
    .locals 2

    .prologue
    .line 43
    invoke-virtual {p0}, Lcom/boyaa/videodemo/utils/WaitProgressDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    iput-object v1, p0, Lcom/boyaa/videodemo/utils/WaitProgressDialog;->window:Landroid/view/Window;

    .line 45
    iget-object v1, p0, Lcom/boyaa/videodemo/utils/WaitProgressDialog;->window:Landroid/view/Window;

    invoke-virtual {v1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    .line 46
    .local v0, "wl":Landroid/view/WindowManager$LayoutParams;
    const/16 v1, 0x11

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 47
    iget-object v1, p0, Lcom/boyaa/videodemo/utils/WaitProgressDialog;->window:Landroid/view/Window;

    invoke-virtual {v1, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 50
    return-void
.end method
