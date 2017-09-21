.class public final Lcom/boyaa/godsdk/callback/CallbackStatus$SDKStatus;
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
    name = "SDKStatus"
.end annotation


# static fields
.field public static final GODSDK_VERSION_NOT_RIGHT:I = 0x65

.field public static final INIT_FAILED:I = 0x64

.field public static final INIT_SUCCESS:I = 0x0

.field public static final QUIT_CANCEL:I = 0x12c

.field public static final QUIT_SUCCESS:I = 0xc8

.field public static final SDK_STATUS_START:I


# instance fields
.field final synthetic this$0:Lcom/boyaa/godsdk/callback/CallbackStatus;


# direct methods
.method public constructor <init>(Lcom/boyaa/godsdk/callback/CallbackStatus;)V
    .locals 0

    .prologue
    .line 36
    iput-object p1, p0, Lcom/boyaa/godsdk/callback/CallbackStatus$SDKStatus;->this$0:Lcom/boyaa/godsdk/callback/CallbackStatus;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
