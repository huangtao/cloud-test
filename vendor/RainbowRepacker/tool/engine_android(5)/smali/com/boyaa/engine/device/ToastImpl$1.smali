.class Lcom/boyaa/engine/device/ToastImpl$1;
.super Ljava/lang/Object;
.source "ToastImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/engine/device/ToastImpl;->showToast(Ljava/lang/String;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$duration:I

.field private final synthetic val$text:Ljava/lang/String;

.field private final synthetic val$vpos:I


# direct methods
.method constructor <init>(ILjava/lang/String;I)V
    .locals 0

    .prologue
    .line 1
    iput p1, p0, Lcom/boyaa/engine/device/ToastImpl$1;->val$duration:I

    iput-object p2, p0, Lcom/boyaa/engine/device/ToastImpl$1;->val$text:Ljava/lang/String;

    iput p3, p0, Lcom/boyaa/engine/device/ToastImpl$1;->val$vpos:I

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 18
    const/4 v0, 0x0

    .line 19
    .local v0, "dur":I
    iget v2, p0, Lcom/boyaa/engine/device/ToastImpl$1;->val$duration:I

    const/16 v3, 0xbb8

    if-le v2, v3, :cond_0

    .line 21
    const/4 v0, 0x1

    .line 24
    :cond_0
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v2

    iget-object v3, p0, Lcom/boyaa/engine/device/ToastImpl$1;->val$text:Ljava/lang/String;

    invoke-static {v2, v3, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    .line 25
    .local v1, "toast":Landroid/widget/Toast;
    iget v2, p0, Lcom/boyaa/engine/device/ToastImpl$1;->val$vpos:I

    packed-switch v2, :pswitch_data_0

    .line 37
    :goto_0
    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 38
    return-void

    .line 28
    :pswitch_0
    const/16 v2, 0x31

    invoke-virtual {v1, v2, v4, v4}, Landroid/widget/Toast;->setGravity(III)V

    goto :goto_0

    .line 31
    :pswitch_1
    const/16 v2, 0x11

    invoke-virtual {v1, v2, v4, v4}, Landroid/widget/Toast;->setGravity(III)V

    goto :goto_0

    .line 34
    :pswitch_2
    const/16 v2, 0x51

    invoke-virtual {v1, v2, v4, v4}, Landroid/widget/Toast;->setGravity(III)V

    goto :goto_0

    .line 25
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
