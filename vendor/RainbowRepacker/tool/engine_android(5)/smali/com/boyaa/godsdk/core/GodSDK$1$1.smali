.class Lcom/boyaa/godsdk/core/GodSDK$1$1;
.super Ljava/lang/Object;
.source "GodSDK.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/godsdk/core/GodSDK$1;->onInitSuccess(Lcom/boyaa/godsdk/callback/CallbackStatus;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/boyaa/godsdk/core/GodSDK$1;

.field private final synthetic val$status:Lcom/boyaa/godsdk/callback/CallbackStatus;


# direct methods
.method constructor <init>(Lcom/boyaa/godsdk/core/GodSDK$1;Lcom/boyaa/godsdk/callback/CallbackStatus;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/godsdk/core/GodSDK$1$1;->this$1:Lcom/boyaa/godsdk/core/GodSDK$1;

    iput-object p2, p0, Lcom/boyaa/godsdk/core/GodSDK$1$1;->val$status:Lcom/boyaa/godsdk/callback/CallbackStatus;

    .line 258
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 262
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDK$1$1;->this$1:Lcom/boyaa/godsdk/core/GodSDK$1;

    # getter for: Lcom/boyaa/godsdk/core/GodSDK$1;->this$0:Lcom/boyaa/godsdk/core/GodSDK;
    invoke-static {v0}, Lcom/boyaa/godsdk/core/GodSDK$1;->access$0(Lcom/boyaa/godsdk/core/GodSDK$1;)Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v0

    # getter for: Lcom/boyaa/godsdk/core/GodSDK;->mOutsideSdkListener:Lcom/boyaa/godsdk/callback/SDKListener;
    invoke-static {v0}, Lcom/boyaa/godsdk/core/GodSDK;->access$1(Lcom/boyaa/godsdk/core/GodSDK;)Lcom/boyaa/godsdk/callback/SDKListener;

    move-result-object v0

    iget-object v1, p0, Lcom/boyaa/godsdk/core/GodSDK$1$1;->val$status:Lcom/boyaa/godsdk/callback/CallbackStatus;

    invoke-interface {v0, v1}, Lcom/boyaa/godsdk/callback/SDKListener;->onInitSuccess(Lcom/boyaa/godsdk/callback/CallbackStatus;)V

    .line 263
    return-void
.end method
