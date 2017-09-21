.class Lcom/boyaa/entity/godsdk/GodSDKHelper$4;
.super Ljava/lang/Object;
.source "GodSDKHelper.java"

# interfaces
.implements Lcom/boyaa/godsdk/callback/PushListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/entity/godsdk/GodSDKHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/entity/godsdk/GodSDKHelper;


# direct methods
.method constructor <init>(Lcom/boyaa/entity/godsdk/GodSDKHelper;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper$4;->this$0:Lcom/boyaa/entity/godsdk/GodSDKHelper;

    .line 292
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAddAliasFailed(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V
    .locals 0
    .param p1, "arg0"    # Lcom/boyaa/godsdk/callback/CallbackStatus;
    .param p2, "arg1"    # Ljava/lang/String;

    .prologue
    .line 297
    return-void
.end method

.method public onAddAliasSuccess(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V
    .locals 0
    .param p1, "arg0"    # Lcom/boyaa/godsdk/callback/CallbackStatus;
    .param p2, "arg1"    # Ljava/lang/String;

    .prologue
    .line 302
    return-void
.end method

.method public onRemoveAliasFailed(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V
    .locals 0
    .param p1, "arg0"    # Lcom/boyaa/godsdk/callback/CallbackStatus;
    .param p2, "arg1"    # Ljava/lang/String;

    .prologue
    .line 307
    return-void
.end method

.method public onRemoveAliasSuccess(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V
    .locals 0
    .param p1, "arg0"    # Lcom/boyaa/godsdk/callback/CallbackStatus;
    .param p2, "arg1"    # Ljava/lang/String;

    .prologue
    .line 312
    return-void
.end method

.method public onRemoveTagsFailed(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V
    .locals 0
    .param p1, "arg0"    # Lcom/boyaa/godsdk/callback/CallbackStatus;
    .param p2, "arg1"    # Ljava/lang/String;

    .prologue
    .line 317
    return-void
.end method

.method public onRemoveTagsSuccess(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V
    .locals 0
    .param p1, "arg0"    # Lcom/boyaa/godsdk/callback/CallbackStatus;
    .param p2, "arg1"    # Ljava/lang/String;

    .prologue
    .line 322
    return-void
.end method

.method public onSetTagsFailed(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V
    .locals 0
    .param p1, "arg0"    # Lcom/boyaa/godsdk/callback/CallbackStatus;
    .param p2, "arg1"    # Ljava/lang/String;

    .prologue
    .line 327
    return-void
.end method

.method public onSetTagsSuccess(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V
    .locals 0
    .param p1, "arg0"    # Lcom/boyaa/godsdk/callback/CallbackStatus;
    .param p2, "arg1"    # Ljava/lang/String;

    .prologue
    .line 332
    return-void
.end method
