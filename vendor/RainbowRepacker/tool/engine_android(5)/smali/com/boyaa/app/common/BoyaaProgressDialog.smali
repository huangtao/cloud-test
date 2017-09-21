.class public Lcom/boyaa/app/common/BoyaaProgressDialog;
.super Landroid/app/AlertDialog;
.source "BoyaaProgressDialog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/boyaa/app/common/BoyaaProgressDialog$onCancelListener;
    }
.end annotation


# instance fields
.field private listener:Lcom/boyaa/app/common/BoyaaProgressDialog$onCancelListener;

.field private mImageView:Landroid/widget/ImageView;

.field private mTipsView:Landroid/widget/TextView;

.field private mTitle:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .locals 1
    .param p1, "context"    # Landroid/app/Activity;

    .prologue
    .line 53
    invoke-direct {p0, p1}, Landroid/app/AlertDialog;-><init>(Landroid/content/Context;)V

    .line 43
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/app/common/BoyaaProgressDialog;->listener:Lcom/boyaa/app/common/BoyaaProgressDialog$onCancelListener;

    .line 54
    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;I)V
    .locals 1
    .param p1, "context"    # Landroid/app/Activity;
    .param p2, "theme"    # I

    .prologue
    .line 57
    invoke-direct {p0, p1, p2}, Landroid/app/AlertDialog;-><init>(Landroid/content/Context;I)V

    .line 43
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/app/common/BoyaaProgressDialog;->listener:Lcom/boyaa/app/common/BoyaaProgressDialog$onCancelListener;

    .line 58
    return-void
.end method

.method public static dismiss(Lcom/boyaa/app/common/BoyaaProgressDialog;)V
    .locals 1
    .param p0, "dialog"    # Lcom/boyaa/app/common/BoyaaProgressDialog;

    .prologue
    .line 83
    if-eqz p0, :cond_1

    .line 84
    invoke-virtual {p0}, Lcom/boyaa/app/common/BoyaaProgressDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 85
    invoke-virtual {p0}, Lcom/boyaa/app/common/BoyaaProgressDialog;->dismiss()V

    .line 87
    :cond_0
    const/4 p0, 0x0

    .line 89
    :cond_1
    return-void
.end method

.method public static show(Landroid/app/Activity;Ljava/lang/CharSequence;)Lcom/boyaa/app/common/BoyaaProgressDialog;
    .locals 3
    .param p0, "context"    # Landroid/app/Activity;
    .param p1, "title"    # Ljava/lang/CharSequence;

    .prologue
    const/4 v2, 0x0

    .line 61
    new-instance v0, Lcom/boyaa/app/common/BoyaaProgressDialog;

    invoke-direct {v0, p0}, Lcom/boyaa/app/common/BoyaaProgressDialog;-><init>(Landroid/app/Activity;)V

    .line 62
    .local v0, "dialog":Lcom/boyaa/app/common/BoyaaProgressDialog;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/boyaa/app/common/BoyaaProgressDialog;->requestWindowFeature(I)Z

    .line 63
    invoke-virtual {v0, v2}, Lcom/boyaa/app/common/BoyaaProgressDialog;->setCancelable(Z)V

    .line 64
    invoke-virtual {v0, v2}, Lcom/boyaa/app/common/BoyaaProgressDialog;->setCanceledOnTouchOutside(Z)V

    .line 65
    iput-object p1, v0, Lcom/boyaa/app/common/BoyaaProgressDialog;->mTitle:Ljava/lang/CharSequence;

    .line 66
    invoke-virtual {v0}, Lcom/boyaa/app/common/BoyaaProgressDialog;->show()V

    .line 68
    return-object v0
.end method

.method public static show(Landroid/app/Activity;Ljava/lang/CharSequence;I)Lcom/boyaa/app/common/BoyaaProgressDialog;
    .locals 3
    .param p0, "context"    # Landroid/app/Activity;
    .param p1, "title"    # Ljava/lang/CharSequence;
    .param p2, "theme"    # I

    .prologue
    const/4 v2, 0x0

    .line 72
    new-instance v0, Lcom/boyaa/app/common/BoyaaProgressDialog;

    invoke-direct {v0, p0, p2}, Lcom/boyaa/app/common/BoyaaProgressDialog;-><init>(Landroid/app/Activity;I)V

    .line 73
    .local v0, "dialog":Lcom/boyaa/app/common/BoyaaProgressDialog;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/boyaa/app/common/BoyaaProgressDialog;->requestWindowFeature(I)Z

    .line 74
    invoke-virtual {v0, v2}, Lcom/boyaa/app/common/BoyaaProgressDialog;->setCancelable(Z)V

    .line 75
    invoke-virtual {v0, v2}, Lcom/boyaa/app/common/BoyaaProgressDialog;->setCanceledOnTouchOutside(Z)V

    .line 76
    iput-object p1, v0, Lcom/boyaa/app/common/BoyaaProgressDialog;->mTitle:Ljava/lang/CharSequence;

    .line 77
    invoke-virtual {v0}, Lcom/boyaa/app/common/BoyaaProgressDialog;->show()V

    .line 79
    return-object v0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 10
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/high16 v4, 0x3f000000    # 0.5f

    const/4 v3, 0x1

    .line 93
    invoke-super {p0, p1}, Landroid/app/AlertDialog;->onCreate(Landroid/os/Bundle;)V

    .line 94
    invoke-virtual {p0}, Lcom/boyaa/app/common/BoyaaProgressDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v7

    .line 95
    .local v7, "inflater":Landroid/view/LayoutInflater;
    const v1, 0x7f030002

    const/4 v2, 0x0

    invoke-virtual {v7, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v9

    .line 96
    .local v9, "view":Landroid/view/View;
    const v1, 0x7f060018

    invoke-virtual {v9, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/boyaa/app/common/BoyaaProgressDialog;->mImageView:Landroid/widget/ImageView;

    .line 97
    const v1, 0x7f060019

    invoke-virtual {v9, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/boyaa/app/common/BoyaaProgressDialog;->mTipsView:Landroid/widget/TextView;

    .line 98
    iget-object v1, p0, Lcom/boyaa/app/common/BoyaaProgressDialog;->mTipsView:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/boyaa/app/common/BoyaaProgressDialog;->mTitle:Ljava/lang/CharSequence;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 99
    iget-object v1, p0, Lcom/boyaa/app/common/BoyaaProgressDialog;->mTipsView:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v8

    .line 100
    .local v8, "paint":Landroid/text/TextPaint;
    invoke-virtual {v8, v3}, Landroid/text/TextPaint;->setFakeBoldText(Z)V

    .line 101
    invoke-virtual {p0, v9}, Lcom/boyaa/app/common/BoyaaProgressDialog;->setContentView(Landroid/view/View;)V

    .line 103
    new-instance v0, Landroid/view/animation/RotateAnimation;

    const/4 v1, 0x0

    const v2, -0x3c4c8000    # -359.0f

    move v5, v3

    move v6, v4

    invoke-direct/range {v0 .. v6}, Landroid/view/animation/RotateAnimation;-><init>(FFIFIF)V

    .line 106
    .local v0, "animation":Landroid/view/animation/RotateAnimation;
    const-wide/16 v1, 0x320

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/RotateAnimation;->setDuration(J)V

    .line 107
    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/view/animation/RotateAnimation;->setRepeatCount(I)V

    .line 108
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/animation/RotateAnimation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 109
    iget-object v1, p0, Lcom/boyaa/app/common/BoyaaProgressDialog;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setAnimation(Landroid/view/animation/Animation;)V

    .line 110
    invoke-virtual {v0}, Landroid/view/animation/RotateAnimation;->start()V

    .line 112
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 128
    const/4 v0, 0x4

    if-ne p1, v0, :cond_1

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    if-nez v0, :cond_1

    .line 130
    iget-object v0, p0, Lcom/boyaa/app/common/BoyaaProgressDialog;->listener:Lcom/boyaa/app/common/BoyaaProgressDialog$onCancelListener;

    if-eqz v0, :cond_0

    .line 132
    iget-object v0, p0, Lcom/boyaa/app/common/BoyaaProgressDialog;->listener:Lcom/boyaa/app/common/BoyaaProgressDialog$onCancelListener;

    invoke-interface {v0}, Lcom/boyaa/app/common/BoyaaProgressDialog$onCancelListener;->onCancel()V

    .line 134
    :cond_0
    const/4 v0, 0x1

    .line 137
    :goto_0
    return v0

    :cond_1
    invoke-super {p0, p1, p2}, Landroid/app/AlertDialog;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method public onStart()V
    .locals 0

    .prologue
    .line 116
    invoke-super {p0}, Landroid/app/AlertDialog;->onStart()V

    .line 118
    return-void
.end method

.method protected onStop()V
    .locals 2

    .prologue
    .line 122
    invoke-super {p0}, Landroid/app/AlertDialog;->onStop()V

    .line 123
    iget-object v0, p0, Lcom/boyaa/app/common/BoyaaProgressDialog;->mImageView:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setAnimation(Landroid/view/animation/Animation;)V

    .line 125
    return-void
.end method

.method public setOnCancelListener(Lcom/boyaa/app/common/BoyaaProgressDialog$onCancelListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/boyaa/app/common/BoyaaProgressDialog$onCancelListener;

    .prologue
    .line 46
    iput-object p1, p0, Lcom/boyaa/app/common/BoyaaProgressDialog;->listener:Lcom/boyaa/app/common/BoyaaProgressDialog$onCancelListener;

    .line 47
    return-void
.end method
