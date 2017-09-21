.class public final Lcom/boyaa/godsdk/callback/CallbackStatus$IAPStatus;
.super Ljava/lang/Object;
.source "CallbackStatus.java"

# interfaces
.implements Lcom/boyaa/godsdk/callback/CallbackStatus$BaseCallbackStatus;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/godsdk/callback/CallbackStatus;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "IAPStatus"
.end annotation


# static fields
.field public static final IAP_STATUS_START:I = 0x4e20

.field public static final PAY_CANCELED:I = 0x4e85

.field public static final PAY_FAILED:I = 0x4e84

.field public static final PAY_ILLEGAL_PARAMS:I = 0x4e87

.field public static final PAY_SUBMIT:I = 0x4e21

.field public static final PAY_SUCCESS:I = 0x4e20

.field public static final PAY_TIMEOUT:I = 0x4e86


# instance fields
.field final synthetic this$0:Lcom/boyaa/godsdk/callback/CallbackStatus;


# direct methods
.method public constructor <init>(Lcom/boyaa/godsdk/callback/CallbackStatus;)V
    .locals 0

    .prologue
    .line 111
    iput-object p1, p0, Lcom/boyaa/godsdk/callback/CallbackStatus$IAPStatus;->this$0:Lcom/boyaa/godsdk/callback/CallbackStatus;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
