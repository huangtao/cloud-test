.class public final Lcom/boyaa/godsdk/callback/CallbackStatus$ShareStatus;
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
    name = "ShareStatus"
.end annotation


# static fields
.field public static final RESULT_CODE_UnknownError:I = 0x1129c

.field public static final RESULT_CODE_cancel:I = 0x111d4

.field public static final RESULT_CODE_fail:I = 0x11238

.field public static final RESULT_CODE_success:I = 0x11170

.field public static final SHARE_STATUS_START:I = 0x11170


# instance fields
.field final synthetic this$0:Lcom/boyaa/godsdk/callback/CallbackStatus;


# direct methods
.method public constructor <init>(Lcom/boyaa/godsdk/callback/CallbackStatus;)V
    .locals 0

    .prologue
    .line 260
    iput-object p1, p0, Lcom/boyaa/godsdk/callback/CallbackStatus$ShareStatus;->this$0:Lcom/boyaa/godsdk/callback/CallbackStatus;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
