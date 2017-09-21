.class public Lcom/boyaa/widget/BoyaaToast;
.super Ljava/lang/Object;
.source "BoyaaToast.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/boyaa/widget/BoyaaToast$BoyaaToastHolder;
    }
.end annotation


# instance fields
.field private mToast:Landroid/widget/Toast;


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/widget/BoyaaToast;->mToast:Landroid/widget/Toast;

    .line 9
    return-void
.end method

.method synthetic constructor <init>(Lcom/boyaa/widget/BoyaaToast;)V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Lcom/boyaa/widget/BoyaaToast;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/boyaa/widget/BoyaaToast;
    .locals 1

    .prologue
    .line 16
    sget-object v0, Lcom/boyaa/widget/BoyaaToast$BoyaaToastHolder;->mInstance:Lcom/boyaa/widget/BoyaaToast;

    return-object v0
.end method


# virtual methods
.method public show(Landroid/content/Context;Ljava/lang/String;I)V
    .locals 1
    .param p1, "cxt"    # Landroid/content/Context;
    .param p2, "text"    # Ljava/lang/String;
    .param p3, "duration"    # I

    .prologue
    .line 20
    iget-object v0, p0, Lcom/boyaa/widget/BoyaaToast;->mToast:Landroid/widget/Toast;

    if-nez v0, :cond_0

    .line 21
    invoke-static {p1, p2, p3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    iput-object v0, p0, Lcom/boyaa/widget/BoyaaToast;->mToast:Landroid/widget/Toast;

    .line 22
    :cond_0
    iget-object v0, p0, Lcom/boyaa/widget/BoyaaToast;->mToast:Landroid/widget/Toast;

    invoke-virtual {v0, p2}, Landroid/widget/Toast;->setText(Ljava/lang/CharSequence;)V

    .line 23
    iget-object v0, p0, Lcom/boyaa/widget/BoyaaToast;->mToast:Landroid/widget/Toast;

    invoke-virtual {v0, p3}, Landroid/widget/Toast;->setDuration(I)V

    .line 24
    iget-object v0, p0, Lcom/boyaa/widget/BoyaaToast;->mToast:Landroid/widget/Toast;

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 25
    return-void
.end method
