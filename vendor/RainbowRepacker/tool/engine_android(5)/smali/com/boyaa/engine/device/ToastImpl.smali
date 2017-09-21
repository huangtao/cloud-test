.class public Lcom/boyaa/engine/device/ToastImpl;
.super Ljava/lang/Object;
.source "ToastImpl.java"


# static fields
.field private static final BOTTOM:I = 0x2

.field private static final CENTER:I = 0x1

.field private static final TOP:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static showToast(Ljava/lang/String;II)V
    .locals 2
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "vpos"    # I
    .param p2, "duration"    # I

    .prologue
    .line 14
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lcom/boyaa/engine/device/ToastImpl$1;

    invoke-direct {v1, p2, p0, p1}, Lcom/boyaa/engine/device/ToastImpl$1;-><init>(ILjava/lang/String;I)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 40
    return-void
.end method
